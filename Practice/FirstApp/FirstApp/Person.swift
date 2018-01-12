//
//  Person.swift
//  FirstApp
//
//  Created by 박소정 on 2018. 1. 11..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

/// 사람에 대한 정보를 만들어주는 클래스입니다
class PersonInfomation {
    var name :String = ""
    var height : Double = 0.0
    var age: Int = 0
    var job : String = ""
    var weight : Double = 0.0
    var salary : Int = 0
    var hour : Int = 0
    
    func Run() {
        print("달린다")
    }
    
    func Walk() {
        print("걷는다")
    }
    
    func Think() {
        print("생각한다")
    }
    
    func PhysiologicalPhenomenon() {
        print("생리현상")
    }
    
    func Emotion() {
        print("감정표현")
    }
    
    /// 대화를 출력하는 함수이다.
    /// 대화를 나타내는 프린트문
    func Communication() {
        print("대화")
    }
    
    func MoneyCal(salary:Int, hour:Int) -> Int {
        let money: Int = salary / hour
        return money
    }
    
    /// 사람의 정보를 출려해주는 함수
    ///
    /// - Parameter timeMoney: 시급의 정보를 가진 파라미터
    func printInfomation(timeMoney : Int) {
        print("이름 : \(name)\n")
        print("나이 : \(age)살\n")
        print("키 : \(height)CM\n")
        print("몸무게 : \(weight)KG\n")
        print("직업 : \(job)\n")
        print("월급 : \(salary)원\n")
        print("한달근무시간 : \(hour)시간\n")
        print("시급 : \(timeMoney)원")
    }
}

