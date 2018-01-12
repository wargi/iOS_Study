//
//  ViewController.swift
//  Cal
//
//  Created by 박소정 on 2018. 1. 12..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultDisplay: UILabel!
    
    var operationTemp: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clickDidNumber(_ sender: UIButton) {
        let numberStr = sender.titleLabel!.text!
        
        if operationTemp.count > 0
        {
            let secondDisplay = secondNumDisplay.text!
            if secondDisplay == "0"
            {
                secondNumDisplay.text = numberStr
            }
            else
            {
                secondNumDisplay.text = secondNumDisplay.text! + numberStr
            }
        }else
        {
            let firstDisplay = firstNumDisplay.text!
            if firstDisplay == "0"
            {
                firstNumDisplay.text = numberStr
            }
            else
            {
                firstNumDisplay.text = firstNumDisplay.text! + numberStr
            }
        }

        
    }
    
    @IBAction func clickDidCancel(_ sender: UIButton) {
        print("Did Cancel")
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultDisplay.text = "0"
    }
    
    @IBAction func clickDidResult(_ sender: UIButton) {
        print("Did Result")
    }
    
    @IBAction func clickDidAction(_ sender: UIButton) {
        let openStr = sender.titleLabel!.text!
        
        let firstDisplay = firstNumDisplay.text!
        if firstDisplay != "0"
        {
            operationTemp = openStr
        }
    }

}

