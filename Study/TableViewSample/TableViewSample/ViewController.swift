//
//  ViewController.swift
//  TableViewSample
//
//  Created by 박소정 on 2018. 2. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var i : Int = 0
    var strArr : [String] = ["안녕하세요","저는","박상욱","이라고","합니다","잘부탁드립니다."]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.bounds, style : .plain)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections")
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return strArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        i += 1
        print(i)
        //dequeue 큐에서 빼라 ReusableCell
//        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text =  indexPath.row < strArr.count ? "\(strArr[indexPath.row])" : "\(indexPath.row)"
            cell.backgroundColor = .red
        }
        else {
            cell.textLabel?.text =  indexPath.row < strArr.count ? "\(strArr[indexPath.row])" : "\(indexPath.row)"
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "첫번쨰"
        }
        else if section == 1 {
            return "두번째"
        }
        else {
            return "세번째"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        let title = strArr[indexPath.row]
        
        let nextVC = UIViewController()
        nextVC.view.backgroundColor = .white
        present(nextVC, animated: true, completion: nil)
    }
}

