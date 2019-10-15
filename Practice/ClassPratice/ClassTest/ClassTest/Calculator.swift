//
//  Calculator.swift
//  ClassTest
//
//  Created by 박소정 on 2018. 1. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class Calculator
{
    //각 평균 구하기
    func average(student : Person)
    {
        var sum : Int = 0
        var count : Int = 0
        
        for subN in student.subjects {
            sum += subN.score
            count += 1
        }
        
         sum /= count
        print("\(student.name)는 전공은 \(student.major)이고, 평균은 \(sum)입니다")
    }
    
    //가장 싸움을 잘하는 아이는?
    func fighter(students : Person...)
    {
        var maxNum = 0
        var winner : String = ""
        
        for student in students
        {
            if maxNum < student.subjectScore(subName: "싸움")
            {
                maxNum = student.subjectScore(subName: "싸움")
                winner = student.name
            }
        }
        print("이구역의 짱은 \(winner)입니다")
    }
    
    //고딩 둘중 수학점수가 높은 아이는?
    func genius(stu1 : Person, stu2 : Person)
    {
        if stu1.major == "고딩" && stu2.major == "고딩"
        {
            if stu1.subjectScore(subName: "산수") > stu2.subjectScore(subName: "산수")
            {
                print("지니어스는 \(stu1.name)입니다")
            }
            else if stu1.subjectScore(subName: "산수") < stu2.subjectScore(subName: "산수")
            {
                print("지니어스는 \(stu2.name)입니다")
            }
            else
            {
                print("Draw")
            }
        }
        else
        {
            print("둘중 한명이 고등학생이 아닙니다.")
        }
    }
}
