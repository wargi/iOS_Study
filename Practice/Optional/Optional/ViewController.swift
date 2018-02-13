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
        
        let op: OptionalTest = OptionalTest(input1: "11", input2: "8")
        op.isNumber(inputNum1: <#T##String#>, inputNum2: <#T##String#>)
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

