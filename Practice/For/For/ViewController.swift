//
//  ViewController.swift
//  For
//
//  Created by 박상욱 on 2018. 1. 18..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loop : For = For()
        loop.timesTable(num: 4)
        print("\(loop.factorial(num: 5))")
        print("\(loop.collatz(number: 999))")
        print("\(loop.harshad(number: 18))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

