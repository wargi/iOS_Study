//
//  File.swift
//  ConditionalSwitch
//
//  Created by 박소정 on 2018. 1. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class ConditionalSwitch
{
    let PI : Double = 3.141592
    var grade : String = ""
    
    //switch-case
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
    
    //윤년 계산
    func leapYearCompar(year : Int) -> Bool
    {
        switch year {
        case year where year % 100 == 0 && year % 400 == 0:
            return true
        case year where year % 4 == 0:
            return true
        default:
            return false
        }
    }
    
    //년/월을 입력받아 해당 들의 마지막 날을 반환 해주는 함수(윤년 고려)
    func lastDayChange(year : Int, month : Int) -> Int
    {
        let lastDay : Int
        let yearAndMonth : (year : Int , month : Int, leafyear : Bool) = (year, month, leapYearCompar(year: year))
        
        switch yearAndMonth {
        case (_, 2, true):
            lastDay = 29
        case (_, 2, false):
            lastDay = 28
        case (_, let y, _) where y <= 7 && y % 2 == 1 || y > 7 && y % 2 == 0:
            lastDay = 31
        case (_, let y, _) where !(y <= 7 && y % 2 == 1 || y > 7 && y % 2 == 0):
            lastDay = 30
        default:
            lastDay = 0
        }
        return lastDay
    }
    
    //if문 변환
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
}

