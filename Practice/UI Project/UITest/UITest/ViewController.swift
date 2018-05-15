//
//  ViewController.swift
//  UITest
//
//  Created by 박소정 on 2018. 1. 29..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let uiV : UIView = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 100))
//
//        let subView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height / 2))
//
//        let color:UIColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
//        subView.backgroundColor = color
//
//        self.view.addSubview(subView)
    
        let numButton:[UIButton] = makeButton(num: 12)
        let calButton:[UIButton] = makeButton(num: 5)
        let etcButton:[UIButton] = makeButton(num: 3)
        
        let viewList:[UIView] = makeViewList(num: 4)
        addSub(viewList: viewList)
        
        viewList[0].frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height/3)
        viewList[1].frame = CGRect(x: 0, y: viewList[0].bounds.size.height, width: view.bounds.size.width, height: 100)
        viewList[2].frame = CGRect(x: 0, y: viewList[1].bounds.size.height+viewList[0].bounds.size.height, width: (view.bounds.size.width/3)*2, height: view.bounds.height-(viewList[1].bounds.size.height+viewList[0].bounds.size.height))
        viewList[3].frame = CGRect(x: (view.bounds.size.width/3)*2, y: viewList[1].bounds.size.height+viewList[0].bounds.size.height, width: view.bounds.size.width/3, height: view.bounds.height-(viewList[1].bounds.size.height+viewList[0].bounds.size.height))
    }
    
    func makeButton(num : Int) -> [UIButton] {
        var tempButton:[UIButton] = []
        for number in 0..<num {
            let n:UIButton = UIButton()
            n.backgroundColor = getColor(num: number)
            tempButton.append(n)
        }
        return tempButton
    }
    
    func addSub(tempButton : [UIButton])
    {
        for number in 0..<tempButton.count {
            self.view.addSubview(tempButton[number])
        }
    }

//    func updateFrame(tempButton : [UIButton]) -> [UIButton] {
//        for number in 0..<tempButton.count {
//            tempButton[number].frame =
//        }
//    }
    
    func makeViewList(num : Int) -> [UIView]
    {
        var vList:[UIView] = []
        for number in 0..<num
        {
            let v : UIView = UIView()
            v.backgroundColor = getColor(num: number)
            vList.append(v)
        }
        return vList
    }
    
    func getColor(num : Int) -> UIColor
    {
        switch num % 3 {
        case 0:
            return UIColor.orange
        case 1:
            return UIColor.red
        case 2:
             return UIColor.brown
        default:
            return UIColor.black
        }
    }
    
    func addSub(viewList : [UIView])
    {
        for num in 0..<viewList.count {
            self.view.addSubview(viewList[num])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

