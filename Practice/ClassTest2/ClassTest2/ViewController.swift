//
//  ViewController.swift
//  ClassTest2
//
//  Created by 박소정 on 2018. 1. 23..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mazingaZ = Person(name: "마징가Z", major: "초딩", gender: "남")
        mazingaZ.setSubjects(subjectDic: ["국어":80,"산수":100,"슬기로운생활":50,"기술":100,"싸움":99])
        let mazinga = mazingaZ
        mazinga.name = "마징가"
        var sub : Subject = Subject(name: "", score: 0)
        sub.name = "박"
        var ject = sub
        ject.name = "상워기"
        
        print(sub.name,ject.name)
        print(mazingaZ.name, mazinga.name)
        let lazenca = Person(name: "라젠카", major: "고딩", gender: "여")
        lazenca.setSubjects(subjectDic: ["언어":50,"수학":80,"도덕":90,"과학":100,"싸움":87])
        
        let atom = Person(name: "아톰", major: "고딩", gender: "남")
        atom.setSubjects(subjectDic: ["언어":100,"수학":100,"도덕":90,"과학":70,"싸움":50])
        
        
        let cal:Calculator = Calculator()
        cal.averageSubjects(student: mazingaZ)
        cal.averageSubjects(student: lazenca)
        
        cal.jjang(students: mazingaZ, lazenca, atom)
        
        cal.geniusHighSchool(stu1: lazenca, stu2: mazingaZ)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

