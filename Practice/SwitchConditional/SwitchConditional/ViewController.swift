//
//  ViewController.swift
//  SwitchConditional
//
//  Created by 박상욱 on 2018. 1. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sw : ConditionalSwitch = ConditionalSwitch()
        
        print("\(sw.lastDayChange(year: 2100, month: 2))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

