//
//  File.swift
//  ConditionalSwitch
//
//  Created by 박상욱 on 2018. 1. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class ConditionalSwitch
{
    let PI : Double = 3.141592
    var grade : String = ""
    
    //MARK: 기초 switch-case
    //월을 입력받아 해당월의 이름을 반환해주는 함수 (ex: 1 >>> "Jan", 12 >>> "Dec", 13 >> "Error"
    func monthNaming(month : Int) -> String
    {
        var monthName : String = ""
        switch month {
        case 1:
            monthName = "Jan"
        case 2:
            monthName = "Feb"
        case 3:
            monthName = "Mar"
        case 4:
            monthName = "Apr"
        case 5:
            monthName = "May"
        case 6:
            monthName = "Jun"
        case 7:
            monthName = "Jul"
        case 8:
            monthName = "Agu"
        case 9:
            monthName = "Sep"
        case 10:
            monthName = "Oct"
        case 11:
            monthName = "Nov"
        case 12:
            monthName = "Dec"
        default:
            monthName = "Error"
        }
        return monthName
    }
    
    //정수를 하나 입력받아 그 수가 짝수이면 true를  반환하는 함수
    func evenNumberReturn(number : Int) -> Bool {
        switch number {
        case number where number % 2 == 0:
            return true
        default:
            return false
        }
    }
    
    //문자열 두개를 입력받아 두 문자열이 같으면 true를 반환해주는 함수
    func sameString(str1 : String, str2 : String) -> Bool
    {
        let sameStringComp = (String1 : str1, String2 : str2)
        
        switch sameStringComp {
        case (let x, let y) where x == y:
            return true
        default:
            return false
        }
    }
    
    //두 수를 입력받아 큰 수를 반환하는 함수를 작성하세요.
    func numberCompareBig(num1 : Int, num2 : Int) -> Int
    {
        let numberCompare = (number1 : num1, number2 : num2)
        
        switch numberCompare {
        case (let x, let y) where x > y:
            return x
        case (let x, let y) where x < y:
            return y
        default:
            return 0
        }
    }
    
    //정수를 하나 입력받아 3의 배수이면 true를 반환해주는 함수
    func threeMultiCompare(number : Int) -> Bool {
        switch number {
        case number where number % 3 == 0:
            return true
        default:
            return false
        }
    }
    
    // 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수 (첫번째 값을 두번째 값으로 나눈다. 0으로 나누기를 할시 0을 반환)
    func divReturn(num1 : Int, num2 : Int) -> Double
    {
        let numberTemp = (number1 : num1, number2 : num2)
        
        switch numberTemp {
        case (let x, let y) where x != 0 && y != 0:
            return Double(x) / Double(y)
        default:
            return 0
        }
    }
    
    //MARK: 응용
    //등급을 평점으로 변환해주는 함수
    func gradeToPoint(grade : String) -> Double {
        
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        default:
            return 0
        }
    }
    
    //여러개의 grade를 입력받아서 grade의 평균을 반환해주는 함수
    func gradeAverage(grade1 : String, grade2 : String, grade3 : String, grade4 : String) -> String
    {
        var gradeAve : String = ""
        let pointAve : Double = (gradeToPoint(grade: grade1) + gradeToPoint(grade: grade2) + gradeToPoint(grade: grade3) + gradeToPoint(grade: grade4)) / 4
        
        switch pointAve {
        case 4.5:
            gradeAve = "A+"
        case pointAve where pointAve >= 4.0:
            gradeAve = "A"
        case pointAve where pointAve >= 3.5:
            gradeAve = "B+"
        case pointAve where pointAve >= 3.0:
            gradeAve = "B"
        case pointAve where pointAve >= 2.5:
            gradeAve = "C+"
        case pointAve where pointAve >= 2.0:
            gradeAve = "C"
        case pointAve where pointAve >= 1.5:
            gradeAve = "D+"
        case pointAve where pointAve >= 1.0:
            gradeAve = "D"
        default:
            gradeAve = "F"
        }
        return gradeAve
    }
    
    //세 수를 입력받아 그 곱이 양수이면 true, 0 혹은 음수이면 false, 둘 다 아니면 에러를 발생시키는 함수를 작성하세요.
    func resultCompare(num1 : Int, num2 : Int, num3 : Int) -> Bool
    {
        let resultNum = num1 * num2 * num3
        
        switch resultNum {
        case resultNum where resultNum > 0:
            return true
        default:
            return false
        }
    }
    
    //시험점수를 입력받아 대학교 grade로 나눠서 반환해주는 함수 (ex: 95 >>> "A+"  /// 80 >>> "B")
    func scoreChangeGrade(score : Int) -> String
    {
        switch score {
        case 95...100:
            grade = "A+"
        case 90...94:
            grade = "A"
        case 85...89:
            grade = "B+"
        case 80...84:
            grade = "B"
        case 75...79:
            grade = "C+"
        case 70...74:
            grade = "C"
        case 65...69:
            grade = "D+"
        case 60...64:
            grade = "D"
        case 0...59:
            grade = "F"
        default:
            grade = "잘못된 값입니다."
        }
        return grade
    }
    
    //사각형과 원형, 구체의 부피 구하기 함수
    func volume(width : Double = 0, length : Double = 0, height : Double = 0, radian : Double = 0) -> Double {
        let CompareData = (width, length, height, radian)
        var volume : Double = 0.0
        
        switch CompareData {
        case (let x, 0, 0, 0):
            volume = x * area(width: x, height: x, radian: 0)
        case (let x, let y, let z, 0):
            volume = area(width: x, height: y, radian: 0) * z
        case (0, 0, 0, let r):
            volume = 4 / 3 * PI * (r * r * r)
        case (0, 0, let z, let r):
            volume = z * area(radian: r)
        default:
            volume = 0
        }
        
        return volume
    }
    
    //사각형과 원의 넓이 구하기 함수
    func area(width : Double = 0, height : Double = 0, radian : Double = 0) -> Double
    {
        let CompareData = (width, height, radian)
        var area : Double = 0.0
    
        switch CompareData {
        case (let x, 0, 0):
            area = x * x
        case (let x, let y, 0):
            area = x * y
        case (0, 0, let r):
            area = r * r * PI
        default:
            area = 0
        }
        
        return area
    }
    
    //삼각형과 사각형의 넓이 구하기 함수
    func trArea(bottom : Double, top : Double, height : Double) -> Double
    {
        let CompareData = (bottom, top, height)
        var area : Double = 0.0
        switch CompareData {
        case (let x, 0, let z):
            area = x * z * 0.5
        case (let x, let y, let z):
            area = trArea(bottom: x + y, top: 0, height: z)
        default:
            area = 0
        }
        return area
    }
    
    //윤년을 구해서 결과를 참, 거짓으로 리턴하는 함수
    func leap(year : Int) -> Bool {
        switch year {
        case year where year % 100 == 0 && year % 400 == 0 || year % 100 != 0 && year % 4 == 0:
            return true
        default:
            return false
        }
    }
    
    
    /// 년도와 월을 입력 받으면 해당월의 마지막날이 몇일 인지 리턴해주는 함수(윤년을 고려해서)
    /// 년도를 입력 받으면 윤년인지 구해 주는 함수를 호출해서 판단 후 yearAndMonth에 (윤년일시 true 아닐시 false를 입력해주고, 현재월)
    /// - Parameters:
    ///   - year: 년도를 입력받는다
    ///   - month: 월을 입력받는다
    /// - Returns: 마지막 일자를 리턴받는다
    func lastDayChange(year : Int, month : Int) -> Int {
        let yearAndMonth = (leap(year: year), month)
        switch yearAndMonth {
        case (false, 2):
            return 28
        case (true, 2):
            return 29
        case (_, let y) where y < 7 && y % 2 == 0 || y > 8 && y % 2 == 1:
            return 30
        default:
            return 31
        }
    }
}

