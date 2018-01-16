//
//  ToolBox.swift
//  ToolBox
//
//  Created by 박소정 on 2018. 1. 15..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class ToolBoxClass
{
    //inch To cm
    func inchToCm(inch : Double) -> Double {
        return inch * 2.54
    }
    
    //cm To inch
    func cmToInch(cm : Double) -> Double {
        return cm / 2.54
    }
    
    //M2 To Spacious
    func m2ToSpacious(m2 : Double) -> Double {
        return m2 * 0.3025
    }
    
    //Spacious To M2
    func spaciousToM2(spacious : Int) -> Double {
        return Double(spacious) / 3.3058
    }
    
    //F To C
    func fToC(f : Double) -> Double
    {
        return (f-32) / 1.8
    }
    
    //C To F
    func cToF(c : Double) -> Double {
        return c * 1.8 + 32
    }
    
    //KB To MB Or MB To GB
    func byteChange(byte : Int) -> Int {
        return Int(Double(byte) / 1024)
    }
    
    //시간(HHMMSS)을 받으면 초단위로 변경 ex) 11320 >> 4400초
    func secondChange(timeTemp : Int) -> Int {
        let hour : Int = timeTemp / 10000
        let min : Int = (timeTemp - (hour * 10000)) / 100
        let sec : Int = timeTemp % 100
        
        return hour * 3600 + min * 60 + sec
    }
    
    //MARK: 기초
    //1-a 이름(문자열)을 받아서 이름을 출력하는 함수
    func namePrint(name : String)
    {
        print("나의 이름은 \(name)입니다")
    }
    
    //1-b 나이*(정수)를 받아서 나이를 출력하는 함수
    func agePrint(age : Int)
    {
        print("나의 나이는 \(age)입니다")
    }
    
    //1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수
    func introducePrint(name : String, address : String)
    {
        namePrint(name: name)
        print("나의 주소는 \(address)입니다")
        print("반갑습니다 !!")
    }
    
    //정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
    func intToDivision(number : Int) -> Double
    {
        return Double(number) / 2
    }
    
    //정수를 하나 입력받아서 제곱을 반환해주는 함수
    func intToSquare(number : Int) -> Int
    {
        return number * number
    }
    
    //MARK: 응용 - 다중 입력, 반환
    //2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
    func intToSub(number1 : Int, number2 : Int) -> Int
    {
        return number1 - number2
    }
    
    //2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
    func intToAdd(number1 : Int, number2 : Int) -> Int
    {
        return number1 + number2
    }
    
    //2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
    func intToMuk(number1 : Int, number2 : Int) -> Int
    {
        return number1 * number2
    }
    
    //2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수
    func intToDivision(number1 : Int, number2 : Int) -> Int
    {
        return number1 / number2
    }
    
    //MARK: 응용
    //부모님과 내 나이를 입력 후 그 나이차를 프린드 하는 함수
    func parentWithMySub(parentAge : Int, myAge : Int)
    {
        print("어머니의 나이는 \(parentAge)세이고 내 나이는 \(myAge)살이므로 우리의 나이차이는 \(parentAge - myAge)살 입니다.")
    }
    
    //시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수
    func parentWithMySub(sub1 : Int, sub2 : Int, sub3 : Int, sub4 : Int, sub5 : Int) -> Double
    {
        let sum : Int = sub1 + sub2 + sub3 + sub4 + sub5
        return Double(sum) / 5
    }
    
    //MARK: 캐스팅
    //정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
    func intToDouble(number : Int) -> Double
    {
        return Double(number)
    }
    
    //정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
    func twoOfNumberAddToString(number1 : Int, number2 : Int)
    {
        print("\(String(number1) + String(number2))")
    }
    
    //실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수
    func doubleToOneOfPointToRound(number : Double) -> Int
    {
        return Int(round(number))
    }
}
