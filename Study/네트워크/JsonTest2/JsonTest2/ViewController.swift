//
//  ViewController.swift
//  JsonTest2
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        basic()
        stringChange()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func basic() {
        let jsonData = """
          {
            "age": 3,
            "name": "Tory"
          }
          """.data(using: .utf8)!
        
        let dog = try! JSONDecoder().decode(Dog.self, from: jsonData)
        
        print(dog)
    }
    
    func stringChange() {
        let jsonString = """
        {
          "message": "success",
          "number": 3,
          "people": [
            {
              "craft": "ISS",
              "name": "Anton Shkaplerov"
            },
            {
              "craft": "ISS",
              "name": "Scott Tingle"
            },
            {
              "craft": "ISS",
              "name": "Norishige Kanai"
            }
          ]
        }
        """.data(using: .utf8)!
        
        let person = try! JSONDecoder().decode(Persons.self, from: jsonString)
        let people = person.people
        
        print(person)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

struct Persons: Decodable {
    let message: String
    let number: Int
    var people: [People]
    
    struct People: Decodable {
        let name: String
    }
}

struct Dog: Decodable {
    let age: Int
    let name: String

//    //데이터로 들어오는 이름을 스위프트식이나 자기가 원하는 네임으로 바꿀 때 사용
//    private enum CodingKeys: String, CodingKey {
//        case age = "Age" // Age라고 적힌 이름을 age로 변경 시켜준다.
//        case name
//    }
//
      // 컴파일러가 밑의 코드를 자동으로 생성해주지만 커스텀하게 만들려고 할 때는 이부분을 수정해줘야한다.
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        age = try values.decode(Int.self, forKey: .age)
//        name = try values.decode(String.self, forKey: .name)
//    }
}

//extension Dog {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        age = try values.decode(Int.self, forKey: .age)
//        name = try values.decode(String.self, forKey: .name)
//    }
//}

