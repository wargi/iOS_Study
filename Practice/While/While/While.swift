//
//  While.swift
//  While
//
//  Created by 박소정 on 2018. 1. 18..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class While
{
    //MARK: 기초
    //구구단
    func timesTable(times : Int)
    {
        var count : Int = 2
        print("\(times)단")
        while count < 10 && times < 10
        {
            print("\(times) * \(count) = \(count * times)")
            count += 1
        }
    }
    
    //삼각수 구하기
    func triangular(number : Int) -> Int
    {
        var sum : Int = 0
        var temp : Int = number
        
        while temp >= 0
        {
            sum += temp
            temp -= 1
        }
        return sum
    }
    
    // 각 자리수 더하는 함수 (ex : 12345 -> 15)
    func addAll(num : Int) -> Int
    {
        var temp : Int = num
        var sum : Int = 0
        
        while temp > 0
        {
            sum += temp % 10
            temp /= 10
        }
        
        return sum
    }
    
    // 입력받은 숫자를 반대로 출력하는 함수
    func revers(num : Int) -> Int
    {
        var temp : Int = num
        var sum : Int = 0
        
        while temp > 0
        {
            sum = sum * 10 + temp % 10
            temp /= 10
        }
        
        return sum
    }
}
