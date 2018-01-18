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
    
    //MARK: 응용
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
    
    //알고리즘(Collatz 추측)
    //입력된 수가 짝수라면 2로 나누고 홀수라면 3을 곱하고 1을 더한 다음,
    //결과로 나온 수에 같은 작업을 1이 될 때까지 반복할 경우 모든 수가 1이 된다는 추축입니다
    //몇번 만에 1이 반환되는 지 반환하고 500번을 넘어간다면 -1을 반환해 주는 함수
    func collatz(number : Int) -> Int {
        var count : Int = 0
        var temp : Int = number
        
        while temp != 1 && count <= 500
        {
            if temp % 2 == 0
            {
                temp /= 2
            }
            else
            {
                temp = temp * 3 + 1
            }
            count += 1
        }
        return count >= 500 ? -1 : count
    }
    
    ///알고리즘(Harshad 수)
    //양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.
    //예를들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.
    //파라미터를 입력 받았을 때 파라미터 값이 하샤드의 수라면 true, 아니라면 false를 리턴하는 함수
    func harshad(number : Int) -> Bool {
        var sum : Int = 0
        var temp : Int = number
        
        while temp > 0
        {
            sum = sum + (temp % 10)
            temp /= 10
        }
        return number % sum == 0 ? true : false
    }
}
