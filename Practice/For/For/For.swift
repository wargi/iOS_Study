//
//  For.swift
//  For
//
//  Created by 박상욱 on 2018. 1. 18..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class For
{
    //MARK: 기초 for
    //구구단
    func timesTable(num : Int)
    {
        print("\(num)단")
        
        for x in 1...9
        {
            print("\(num) * \(x) = \(num * x)")
        }
    }
    
    //팩토리얼
    func factorial(num : Int) -> Int
    {
        var sum : Int = 1
        
        for x in 1...num
        {
            sum *= x
        }
        return sum
    }
    

}
