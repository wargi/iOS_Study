//
//  ViewController.swift
//  alarm
//
//  Created by 박소정 on 2018. 3. 9..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myPet = [
        Pet(type: .dog , age: 13),
        Pet(type: .dog, age: 2),
        Pet(type: .dog, age: 7),
        Pet(type: .cat, age: 9),
        Pet(type: .snake, age: 4),
        Pet(type: .pig, age: 5),
        ]
    
    let array = ["1j", "2d", "22", "33"]
    

    
    
    let immutableArray: [Int] = Array(1...40)
    var immutableDictionary: [Int:Int] = [:]
    func sum(pets : [Pet]) -> Int {
//        var count = 0
//        for pet in pets {
//            if pet.type == .dog {
//                count += pet.age
//            }
//        }
//        return count
        
        
        //            .filter(isIncluded: { (isCorrect: Pet) throws -> Bool in
        //                return isCorrect.type == .dog
        //            })
        return myPet
            .filter { $0.type == .dog }
            .reduce(0) { $0 + $1.age }
        
    }
    
    func newAge(pets: [Pet]) -> [Pet] {
        var newPets: [Pet] = []
        for pet in pets {
            newPets.append(Pet(type: pet.type, age: pet.age + 1))
        }
        return newPets
    }
    
    func num(numArr: [Int]) -> [Int] {
        return numArr.filter { $0 % 2 == 0 }
    }
    
    func sumArr(numArr: [Int]) -> Int {
        return numArr.reduce(0) { $0 + $1 }
    }
    
    func numAndSum(numArr: [Int]) -> Int {
        return numArr
            .filter { $0 % 2 == 0 }
            .reduce(0) { $0 + $1 }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m1 = array.map({ Int($0) })
        print(m1)
        let f1 = array.flatMap({ Int($0) })
        print(f1)
        
        let m2 = array.map({ Int($0) }).first
        print(m2)
        let f2 = array.flatMap({ Int($0) }).first
        print(f2)
        
        
        for (idx, num) in immutableArray.enumerated() {
            immutableDictionary.updateValue(num, forKey: idx)
        }
        
        
//        immutableArray.enumerated().map( * ).forEach { (num) in
//            print(num)
//        }
//
//        print(immutableDictionary)
//        print(sum(pets: myPet))
//        let newPet = newAge(pets: myPet)
//        print(sum(pets: newPet))
        
        let returnValue = function(firstCitizen)
        
        returnValue()
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firstCitizen() {
        print("function call")
    }
    
    func function(_ parameter: @escaping ()->()) -> (() -> Void) {
        return parameter
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell
        
        return cell
    }
}

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}
