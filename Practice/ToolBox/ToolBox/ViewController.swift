//
//  ViewController.swift
//  ToolBox
//
//  Created by 박소정 on 2018. 1. 15..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let toolBox : ToolBoxClass = ToolBoxClass()
        let secondTime : Int = toolBox.secondChange(timeTemp: 11320)
        let number : Int = toolBox.doubleToOneOfPointToRound(number: 13.7886)
        var inch : Double  = 10
        let cm : Double  = toolBox.inchToCm(inch: inch)
        inch = toolBox.cmToInch(cm: cm)
        var m2 : Double = 39
        let Spacious : Double = toolBox.m2ToSpacious(m2: m2)
        m2 = toolBox.spaciousToM2(spacious: Int(Spacious))
        let f : Double = 12
        let c : Double = 13
        
        
        toolBox.twoOfNumberAddToString(number1: 13, number2: 12)
        print("\(inch)인치")
        print("\(cm)CM")
        print("\(secondTime)초")
        print("\(number)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

