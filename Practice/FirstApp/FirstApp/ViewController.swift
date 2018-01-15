//
//  ViewController.swift
//  FirstApp
//
//  Created by 박소정 on 2018. 1. 11..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 : PersonInfomation = PersonInfomation()
        p1.name = "박상욱"
        p1.age = 26
        p1.hour = 178
        p1.job = "학생"
        p1.height = 185.9
        p1.salary = 2648700
        p1.weight = 76.5
        let partMoney : Int = p1.MoneyCal(salary: p1.salary,hour: p1.hour)
        p1.printInfomation(timeMoney: partMoney)
        
        print(Int.max);
        p1.Emotion()
        p1.Communication()
        p1.Walk()
        p1.Think()
        p1.Run()
        p1.PhysiologicalPhenomenon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

