//
//  OptionalTest.swift
//  Optional
//
//  Created by 박소정 on 2018. 1. 25..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class OptionalTest
{
    var inputNum1: String?
    var inputNum2: String?
    
    init(inputNum : String) {
        inputNum1 = inputNum
    }
    
    convenience init(input1 : String, input2 : String) {
        self.init(inputNum: input1)
        inputNum2 = input2
        isNumber(inputNum1: inputNum1!, inputNum2: inputNum2!)
    }
    
    func isNumber(inputNum1:String, inputNum2:String)
    {
        if let inputNumber1 = Int(inputNum1)
        {
            if let inputNumber2 = Int(inputNum2)
            {
                print(inputNumber1, inputNumber2)
            } else
            {
                print(inputNumber1)
            }
        } else {
            print("nil")
        }
    }
}
