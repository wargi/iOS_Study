//
//  Calculator.swift
//  ClassTest2
//
//  Created by 박소정 on 2018. 1. 23..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class Calculator
{
    func averageSubjects(student : Person)
    {
        var sum : Int = 0
        var count : Int = 1
        
        
        for sub in student.subjects {
            sum += sub.score
            count += 1
        }
        print("전체 과목의 평균은 \(sum / count)입니다.")
    }
    
    func jjang(students : Person...)
    {
        var winnerScore : Int = 0
        var winnerName : String = ""
        
        for student in students
        {
            if winnerScore < student.getSubScore(subName: "싸움")
            {
                winnerName = student.name
                winnerScore = student.getSubScore(subName: "싸움")
            }
        }
        
        print("이 반의 짱은 \(winnerName)이고 싸움점수는 \(winnerScore)입니다.")
    }
    
    func geniusHighSchool(stu1 : Person, stu2 : Person)
    {
        if stu1.getMajor(major: "고딩") == stu2.getMajor(major: "고딩")
        {
            if stu1.getSubScore(subName: "수학") > stu2.getSubScore(subName: "수학")
            {
                print("이 반의 지니어스는 \(stu1.name)이고 수학점수는 \(stu1.getSubScore(subName: "수학"))입니다.")
            }
            else if stu1.getSubScore(subName: "수학") < stu2.getSubScore(subName: "수학")
            {
                print("이 반의 지니어스는 \(stu2.name)이고 수학점수는 \(stu2.getSubScore(subName: "수학"))입니다.")
            }
            else
            {
                print("무승부입니다.")
            }
        }
        else
        {
            print("누군가 고등학생이 아닙니다.")
        }
    }
}
