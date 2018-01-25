//
//  ViewController.swift
//  ClassTest
//
//  Created by 박소정 on 2018. 1. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cal = Calculator()
        
        let mazingaZ = Person(name: "마징가Z", major: "초딩", gender: "남성")
        let aTom = Person(name: "아톰", major: "중딩", gender: "남성")
        let mazingaY = Person(name: "마징가Y", major: "고딩", gender: "여성")
        let bTom = Person(name: "비톰", major: "대딩", gender: "여성")
        let mazingaX = Person(name: "마징가X", major: "고딩", gender: "남성")
        
        
        let dic1 = ["국어" : 87, "산수" : 65, "슬기로운생활" : 43, "기술" : 21, "싸움" : 60]
        let dic2 = ["국어" : 72, "산수" : 51, "슬기로운생활" : 78, "기술" : 18, "싸움" : 22]
        let dic3 = ["국어" : 83, "산수" : 26, "슬기로운생활" : 95, "기술" : 38, "싸움" : 43]
        let dic4 = ["국어" : 45, "산수" : 88, "슬기로운생활" : 46, "기술" : 87, "싸움" : 59]
        let dic5 = ["국어" : 91, "산수" : 34, "슬기로운생활" : 63, "기술" : 65, "싸움" : 77]
        
        mazingaZ.setSubjects(subjectDic: dic1)
        aTom.setSubjects(subjectDic: dic2)
        mazingaY.setSubjects(subjectDic: dic3)
        bTom.setSubjects(subjectDic: dic4)
        mazingaX.setSubjects(subjectDic: dic5)
        
        cal.average(student: mazingaZ)
        cal.fighter(students: mazingaZ, mazingaX, mazingaY, aTom, bTom)
        cal.genius(stu1: mazingaY, stu2: mazingaX)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

