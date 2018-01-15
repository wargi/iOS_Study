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
        print("\(secondTime)초")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

