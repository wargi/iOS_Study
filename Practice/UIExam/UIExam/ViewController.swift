//
//  ViewController.swift
//  UIExam
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count : Int = 0
    var displayBtnView : DisplayBtn!
    var resultLBView : ResultLB!
    var cola : DrinkItem!
    var cider : DrinkItem!
    var coffee : DrinkItem!
    var water : DrinkItem!
    let str1 = "잔액 : "
    let str2 = "원"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachineSetting()
        
    }

    func vendingMachineSetting()
    {
        
        let width:CGFloat = (self.view.bounds.size.width / 2) - 15
        
        displayBtnView = DisplayBtn(frame: CGRect(x: 0, y: self.view.frame.maxY - 80, width: self.view.bounds.width, height: 50))
        view.addSubview(displayBtnView)
        
        resultLBView = ResultLB(frame: CGRect(x: 15, y: displayBtnView.frame.minY - 115, width: self.view.bounds.width - 30, height: 100))
        view.addSubview(resultLBView)
        
        cola = DrinkItem(frame: CGRect(x: 0, y: 30, width: width, height: 250), imgFile: UIImage(named : "콜라")!, price: 1000)
        view.addSubview(cola)
        cider = DrinkItem(frame: CGRect(x: width, y: 30, width: width, height: 250), imgFile: UIImage(named : "사이다")!, price: 800)
        view.addSubview(cider)
        coffee = DrinkItem(frame: CGRect(x: 0, y: cider.frame.maxY+15, width: width, height: 250), imgFile: UIImage(named : "칸타타")!, price: 1500)
        view.addSubview(coffee)
        water = DrinkItem(frame: CGRect(x: width, y: cider.frame.maxY+15, width: width, height: 250), imgFile: UIImage(named : "삼다수")!, price: 500)
        view.addSubview(water)

        displayBtnView.huAddTarget(self, action: #selector(self.clickInputBtn(_:)), for: .touchUpInside)
        displayBtnView.thAddTarget(self, action: #selector(self.clickInputBtn(_:)), for: .touchUpInside)
        displayBtnView.addTarget(self, action: #selector(self.clickInputBtn(_:)), for: .touchUpInside)
        
        cola.addTarget(self, action: #selector(self.clickDrinkItem(_:)), for: .touchUpInside)
        cider.addTarget(self, action: #selector(self.clickDrinkItem(_:)), for: .touchUpInside)
        coffee.addTarget(self, action: #selector(self.clickDrinkItem(_:)), for: .touchUpInside)
        water.addTarget(self, action: #selector(self.clickDrinkItem(_:)), for: .touchUpInside)
    }
    
    @objc func clickInputBtn(_ sender : UIButton) {
        
        if sender.tag == 0 {
            resultLBView.stateLB.text = String(count) + str2 + "이 반환 돠었습니다."
            count = 0
            resultLBView.changedLB.text = str1 + String(count) + str2
        }
        else {
            resultLBView.stateLB.text = String(sender.tag) + str2 + "이 입금 돠었습니다."
            count += sender.tag
            resultLBView.changedLB.text = str1 + String(count) + str2
        }
    }
    
    @objc func clickDrinkItem(_ sender : UIButton) {
        if count >= sender.tag {
            if sender.tag == 1500 {
                resultLBView.stateLB.text = "칸타타가 나왔습니다."
                count -= sender.tag
                resultLBView.changedLB.text = str1 + String(count) + str2
            }
            else if sender.tag == 1000 {
                resultLBView.stateLB.text = "콜라가 나왔습니다."
                count -= sender.tag
                resultLBView.changedLB.text = str1 + String(count) + str2
            }
            else if sender.tag == 800 {
                resultLBView.stateLB.text = "사이다가 나왔습니다."
                count -= sender.tag
                resultLBView.changedLB.text = str1 + String(count) + str2
            }
            else {
                resultLBView.stateLB.text = "물이 나왔습니다."
                count -= sender.tag
                resultLBView.changedLB.text = str1 + String(count) + str2
            }
        }
        else {
            resultLBView.stateLB.text = "돈이 부족합니다."
            resultLBView.changedLB.text = str1 + String(count) + str2
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

