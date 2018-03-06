//
//  ViewController.swift
//  MyCalendar
//
//  Created by 박소정 on 2018. 3. 5..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var myCollectionView: UICollectionView!
    var dayArr: [String] = ["Sun","Mon","Tue","Wen","Thu","Fri","Sat"]
    var calendar:CalendarDate!
    @IBOutlet var mainTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar = CalendarDate(year: 2018, month: 3)
        mainTitle.text = "\(calendar.year!)" + "년 " + "\(calendar.month!)" + "월"
        mainTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let firstDay = calendar.firstDay() - 1
        
        if indexPath.section == 0 {
            cell.backgroundColor = .white
            cell.cellTitle.text = dayArr[indexPath.row]
        } else if indexPath.row < firstDay {
            cell.backgroundColor = .white
            cell.cellTitle.text = ""
        } else {
            cell.backgroundColor = .red
            cell.date = calendar.dataInput(year: calendar.year, month: calendar.month, day: indexPath.row - firstDay + 1)
            cell.cellTitle.text = "\(indexPath.row - firstDay + 1)"
        }
        
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }
        else {
            return calendar.leapYear(year: calendar.year, month: calendar.month) + calendar.firstDay() - 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let index = indexPath.row - calendar.firstDay() + 2

        print(calendar.dataInput(year: calendar.year, month: calendar.month, day: index))
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = myCollectionView.bounds.width / 7
        
        if indexPath.section == 0 {
            return CGSize(width: width, height: 25)
        } else {
            return CGSize(width: width, height: 50)
        }
    }
    
    @IBAction func nextMonth(_ sender: UIButton) {
        guard var month = calendar.month, var year = calendar.year else { return }
        if calendar.month == 12 {
            year += 1
            month = 1
        } else {
            month += 1
        }
        reload(year: year, month: month)
    }
    
    @IBAction func previousMonth(_ sender: UIButton) {
        guard var month = calendar.month, var year = calendar.year else { return }
        if calendar.month == 1 {
            year -= 1
            month = 12
        } else {
            month -= 1
        }
        reload(year: year, month: month)
    }

    func reload(year: Int, month: Int) {
        calendar.year = year
        calendar.month = month
        mainTitle.text = "\(year)" + "년 " + "\(month)" + "월"
        calendar.data = calendar.dataInput(year: year, month: month, day: 1)
        
        myCollectionView.reloadData()
    }
}

