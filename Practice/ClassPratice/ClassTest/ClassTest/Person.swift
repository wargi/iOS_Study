//
//  Person.swift
//  ClassTest
//
//  Created by 박소정 on 2018. 1. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class Person {
    var name : String
    var major : String
    var gender : String
    
    var subjects: [Subject] = []

    
    init(name : String, major : String, gender : String) {
        self.name = name
        self.major = major
        self.gender = gender
    }
    
    func addSubject(name : String, score : Int)
    {
        subjects.append(Subject(name: name, score: score))
    }
    
    func setSubjects(subjectDic:[String:Int])
    {
        for (subName, subScore) in subjectDic
        {
            addSubject(name: subName, score: subScore)
        }
    }
    
    func subjectScore(subName name : String) -> Int {
        
        for sub in subjects {
            if sub.name == name
            {
                return sub.score
            }
        }
        return 0
    }
    
    func getMajor(major : String) -> Bool {
        if self.major == major
        {
            return true
        }
        return false
    }
}
