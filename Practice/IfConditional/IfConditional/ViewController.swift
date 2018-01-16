//
//  ViewController.swift
//  conditional
//
//  Created by 박소정 on 2018. 1. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let con : IfConditional = IfConditional()
        con.score = 87
        con.grade = con.scoreToGrade(score: con.score)
        con.point = con.gradeToPoint(grade: con.grade)
        con.grade = con.gradeAverage(grade1: "A", grade2: "B", grade3: "C", grade4: "D")
        
        print("23은 짝수 인가요 ? \(con.evenNumberReturn(number: 23))")
        print("박상욱과 박소정은 같은 이름인가요 ? \(con.sameString(str1: "박상욱", str2: "박소정"))")
        print("19와 99중 큰수는 : \(con.numberCompareBig(num1: 19, num2: 99))")
        print("126은 3의 배수인가요? \(con.threeMultiCompare(number: 126))")
        print("10나누기 3은 ? \(con.divReturn(num1: 10, num2: 3))")
        print("영어 A 수학 B 과학 C 국사 D\n당신의 각각의 과목 등급입니다. 평균 등급은 \(con.grade)입니다.")
        print("2018년은 윤년입니까 ? \(con.leapYearCompar(year: 2018))")
        print("17 * 32 * 0 은 양수 입니까(0은 포함하지않음) ? \(con.resultCompare(num1: 17, num2: 32, num3: 0))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

