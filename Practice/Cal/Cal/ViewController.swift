//
//  ViewController.swift
//  Cal
//
//  Created by 박소정 on 2018. 1. 12..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultDisplay: UILabel!
    
    var operationTemp: String = ""
    
    var firstNum : String = "0"
    var secondNum : String = "0"
    var resultNum : String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Action Method
    
    @IBAction func clickDidNumber(_ sender: UIButton) {
        
        //버튼에 있는 텍스트 가져오기
        let numberStr = sender.titleLabel!.text!
        
        //연산자 유무확인
        if operationTemp.count > 0
        {
//            let secondDisplay = secondNumDisplay.text
            
            if secondNum == "0"
            {
                secondNum = numberStr
//                secondNumDisplay.text = numberStr
            }
            else
            {
//                secondNumDisplay.text = secondNumDisplay.text! + numberStr
                secondNum = secondNum + numberStr
            }
            secondNumDisplay.text = secondNum
        }
        else
        {
//            let firstDisplay = firstNumDisplay.text!
            if firstNum == "0"
            {
//                firstNumDisplay.text = numberStr
                resetDisplay()
                firstNum = numberStr
            }
            else
            {
//                firstNumDisplay.text = firstNumDisplay.text! + numberStr
                firstNum = firstNum + numberStr
            }
            
            firstNumDisplay.text = firstNum
        }

        
    }
    
    @IBAction func clickDidCancel(_ sender: UIButton)
    {
        resetDate()
        resetDisplay()
    }
    
    /// 연산기호 '='을 눌렀을 때 secondNumStr에 secondNumDisplay의 (문자)값을 보낸다
    /// secondNumStr의 값이 (문자)"0"과 같지 않을때 firstNum에 firstNumDisPlay의 text값을 보내준다
    /// 마찬가지로 secondNum에 secondNumDisplay의 text값을 보내준고, op에 operationTemp가 가지고 있는 연산기호를 넘긴다.
    /// resultNum에 calculation함수를 사용해 first
    /// - Parameter sender: 버튼을 눌렀을때 보내는 값
    @IBAction func clickDidResult(_ sender: UIButton)
    {
//        let secondNumStr = secondNumDisplay.text!
        if secondNum != "0"
        {
            let firstNumTemp : Int = Int(firstNum)!
            let secondNumTemp : Int = Int(secondNum)!
            let op : String = operationTemp
            
            let resultNum = calculation(firstNum: firstNumTemp, operation: op, secondNum: secondNumTemp)
            resultDisplay.text = String(resultNum)
            resetDate()
            
        }
    }
    
    /// 연산기호를 눌렀을때 openStr에 연산기호를 저장하고 firstDisplay에 첫번째 화면의 텍스트값의 정보를 저장해준다
    /// 첫번째 화면이 (문자)0이 아닐때 연산기호(openStr)를 operationTemp에 연산기호(openStr)를 저장한다
    /// - Parameter sender: 버튼을 눌렀을때 보내는 값
    @IBAction func clickDidAction(_ sender: UIButton)
    {
        let openStr = sender.titleLabel!.text!
//        let firstDisplay = firstNumDisplay.text!
        
        if firstNum != "0"
        {
            operationTemp = openStr
            changeColor(by: openStr)
        }
    }
    
    
    //MARK: - Private Method
    
    /// 연산함수
    /// 두수를 연산자에 따라 연산하고 결과값을 리턴해준다
    /// - Parameters:
    ///   - firstNum: 첫번째 레이블의 표시된 숫자
    ///   - operation: 연산을 위한 연산자
    ///   - secondNum: 두번째 디스플레이에 표시된 숫자
    /// - Returns: 연산 결과값 반환
    private func calculation(firstNum:Int, operation:String, secondNum:Int) -> Int
    {
        var resultNum: Int = 0
        
        switch  operation {
        case "✚":
            resultNum = firstNum + secondNum
        case "−":
            resultNum = firstNum - secondNum
        case "𝘅":
            resultNum = firstNum * secondNum
        case "÷":
            resultNum = firstNum / secondNum
        default:
            print("에러")
        }
        
        return resultNum
    }
    
    //데이터 리셋
    private func resetDate()
    {
        firstNum = "0"
        secondNum = "0"
        resultNum = "0"
        operationTemp = ""
    }
    
    //UI리셋
    private func resetDisplay()
    {
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultDisplay.text = "0"
        changeLabelBG(color: .white)
    }
    private func changeColor(by operation:String)
    {
        var color : UIColor
        
        switch  operation {
        case "✚":
            color = .red
        case "−":
            color = .green
        case "𝘅":
            color = .blue
        case "÷":
            color = .yellow
        default:
            color = .white
        }
        changeLabelBG(color: color)
    }
    private func changeLabelBG(color:UIColor)
    {
        firstNumDisplay.backgroundColor = color
        secondNumDisplay.backgroundColor = color
        resultDisplay.backgroundColor = color
    }
}

