//
//  ViewController.swift
//  Cal2
//
//  Created by 박소정 on 2018. 1. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fitstLabelDisplay: UILabel!
    @IBOutlet weak var secondLabelDisplay: UILabel!
    @IBOutlet weak var resultLabelDisplay: UILabel!
    
    var operationTemp:String = ""
    
    var firstNum:String = "0"
    var secondNum:String = "0"
    var resultNum:String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sendNumber(_ sender: UIButton) {
        let openStr = sender.titleLabel!.text!
        
        if operationTemp.count != 0
        {
            if secondNum == "0"
            {
                secondNum = openStr
            }
            else
            {
                secondNum += openStr
            }
            secondLabelDisplay.text = secondNum
        }
        else
        {
            if firstNum == "0"
            {
                firstNum = openStr
            }
            else
            {
                firstNum += openStr
            }
            fitstLabelDisplay.text = firstNum
        }
        
    }
    
    @IBAction func sendOperator(_ sender: UIButton) {
        if firstNum != "0" {
            operationTemp = sender.titleLabel!.text!
        }
        
        
    }
    func calculatorNum(operation : String, firstNum : Int, secondNum : Int) -> String {
        
        var resultNum : Int = 0
        
        switch operation {
        case "+":
            resultNum = firstNum + secondNum
        case "-":
            resultNum = firstNum - secondNum
        case "*":
            resultNum = firstNum * secondNum
        case "/":
            resultNum = firstNum / secondNum
        default:
            print("에러")
        }
        return String(resultNum)

    }
    
    @IBAction func sendReset(_ sender: UIButton) {
        resetDisplay()
        resetData()
    }
    func resetDisplay() {
        fitstLabelDisplay.text! = "0"
        secondLabelDisplay.text! = "0"
        resultLabelDisplay.text! = "0"
    }
    func resetData() {
        firstNum = "0"
        secondNum = "0"
        resultNum = "0"
        operationTemp = ""
    }
    @IBAction func sendResult(_ sender: UIButton) {
        if secondNum != "0"
        {
            let firstNumTemp = Int(firstNum)
            let secondNumTemp = Int(secondNum)
            
            resultLabelDisplay.text = calculatorNum(operation: operationTemp, firstNum: firstNumTemp!, secondNum: secondNumTemp!)
            
            resetData()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

