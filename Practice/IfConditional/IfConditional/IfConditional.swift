//
//  File.swift
//  conditional
//
//  Created by 박상욱 on 2018. 1. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class  IfConditional
{

    //MARK: 기초
    // 시험 점수와 등급, 학점을 받을 공간 생성
    var score : Int = 0
    var grade : String = ""
    var point : Double = 0.0
    
    // 등급을 받아서 학점을 리턴 해주는 함수
    func gradeToPoint(grade : String) -> Double {
        
        if grade == "A+"
        {
            return 4.5
        }
        else if grade == "A"
        {
            return 4.0
        }
        else if grade == "B+"
        {
            return 3.5
        }
        else if grade == "B"
        {
            return 3.0
        }
        else if grade == "C+"
        {
            return 2.5
        }
        else if grade == "C"
        {
            return 2.0
        }
        else if grade == "D"
        {
            return 1.5
        }
        else
        {
            return 0
        }
    }
    
    func printResult(grade : String, score : Int, point : Double)
    {
        print("점수 : \(score)\n등급 : \(grade)\n학점 : \(point)")
    }
    
    
    //<if>
    //1. 정수를 하나 입력받아 그 수가 짝수이면 true를  반환하는 함수
    func evenNumberReturn(number : Int) -> Bool
    {
        return number % 2 == 0 ? true : false
    }
    
    //2. 문자열 두개를 입력받아 두 문자열이 같으면 true를 반환해주는 함수
    func sameString(str1 : String, str2 : String) -> Bool
    {
        return str1 == str2 ? true : false
    }
    
    //3. 두 수를 입력받아 큰 수를 반환하는 함수
    func numberCompareBig(num1 : Int, num2 : Int) -> Int
    {
        if num1 == num2
        {
            return 0
        }
        else if num1 > num2
        {
            return num1
        }
        else
        {
            return num2
        }
    }
    
    //4. 정수를 하나 입력받아 3의 배수이면 true를 반환해주는 함수
    func threeMultiCompare(number : Int) -> Bool
    {
        return number % 3 == 0 ? true : false
    }
    
    // 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)
    func divReturn(num1 : Int, num2 : Int) -> Double {
        
        let resultNum : Double = Double(num1) / Double(num2)
        
        return resultNum != 0 ? resultNum : 0
    }
    
    //MARK: 응용
    //시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
    func scoreToGrade(score : Int) -> String
    {
        var resultNum : String = "잘못된 값입니다"
        if score < 100
        {
            if score >= 95
            {
                resultNum = "A+"
            }
            else if score >= 90
            {
                resultNum = "A"
            }
            else if score >= 85
            {
                resultNum = "B+"
            }
            else if score >= 80
            {
                resultNum = "B"
            }
            else if score >= 75
            {
                resultNum = "C+"
            }
            else if score >= 70
            {
                resultNum = "C"
            }
            else if score >= 65
            {
                resultNum = "D"
            }
            else if score < 65
            {
                resultNum = "F"
            }
        }
        return resultNum
    }
    
    //여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
    func gradeAverage(grade1 : String, grade2 : String, grade3 : String, grade4 : String) -> String
    {
        
        var gradeAve : String = ""
        let pointAve : Double = (gradeToPoint(grade: grade1) + gradeToPoint(grade: grade2) + gradeToPoint(grade: grade3) + gradeToPoint(grade: grade4)) / 4
        
        if pointAve >= 4.5
        {
            gradeAve = "A+"
        }
        else if pointAve >= 4.0
        {
            gradeAve = "A"
        }
        else if pointAve >= 3.5
        {
            gradeAve = "B+"
        }
        else if pointAve >= 3.0
        {
            gradeAve = "B"
        }
        else if pointAve >= 2.5
        {
            gradeAve = "C+"
        }
        else if pointAve >= 2.0
        {
            gradeAve = "C"
        }
        else if pointAve >= 1.5
        {
            gradeAve = "D"
        }
        else
        {
            gradeAve = "F"
        }
        
        return gradeAve
    }
    
    //윤년 구하기 문제(년도를 받아서 윤년인지 아닌지 판단하는 함수)
    func leapYearCompar(year : Int) -> Bool
    {
        let leapYear : Bool
        
        if year % 100 == 0
        {
            leapYear = year % 400 == 0 ? true : false
        }
        else
        {
            leapYear = year % 4 == 0 ? true : false
        }
        
        return leapYear
    }
    
    //세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.
    func resultCompare(num1 : Int, num2 : Int, num3 : Int) -> Bool
    {
        
        let resultNum = num1 * num2 * num3
        
        return resultNum > 0 ? true : false
    }
    
}

