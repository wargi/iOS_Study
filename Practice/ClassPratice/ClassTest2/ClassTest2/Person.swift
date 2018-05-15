//
//  Person.swift
//  ClassTest2
//
//  Created by 박소정 on 2018. 1. 23..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class Person
{
    var name : String
    var major : String
    var gender : String
    var list:[Int] = []
    var subjects : [Subject] = []
    
    init(name : String, major : String, gender : String) {
        self.name = name
        self.major = major
        self.gender = gender
    }
    
    func setSubjects(subjectDic sub : [String:Int])
    {
        for (subName, subScore) in sub {
            addSubject(subName: subName,subScore: subScore)
        }
    }
    
    func addSubject(subName name : String, subScore score : Int)
    {
        subjects.append(Subject(name: name, score: score))
    }
    
    func getSubScore(subName : String) -> Int {
        for sub in subjects
        {
            if sub.name == subName
            {
                return sub.score
            }
        }
        return 0
    }
    
    func getMajor(major name : String) -> Bool {
        if self.major == name
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}
