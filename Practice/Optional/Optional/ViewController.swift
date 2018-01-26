//
//  ViewController.swift
//  Optional
//
//  Created by 박소정 on 2018. 1. 25..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let op: OptionalTest = OptionalTest()
        let inputNum1: String? = "11"
        let inputNum2: String? = "2"
        
        func isNumber(inputNum1:String, inputNum2:String) -> Bool
        {
            if let inputNumber1 = Int(inputNum1)
            {
                if let inputNumber2 = Int(inputNum2)
                {
                    return true
                } else
                {
                    return false
                }
            }
            return false
        }
        
        print("\(isNumber(inputNum1: (inputNum1)!, inputNum2: (inputNum2)!))")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

