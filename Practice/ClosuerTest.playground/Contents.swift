//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var intArr = [1,2,3,4,5]

let changeStringArr = { (intArr : [Int]) -> [String] in
    var strArr:[String] = []
    for num in intArr {
        strArr.append(String(num))
    }
    return strArr
}

print(changeStringArr(intArr))

let evenNumber = { (intArr : [Int]) -> [Int] in
    intArr.filter({ (num) -> Bool in
        return num % 2 == 0
    })
}

print(evenNumber(intArr))

func calculator(num1 : Int, num2 : Int, cal: (Int, Int) -> Int) -> Int {
    return cal(num1, num2)
}

let sum = calculator(num1: 10, num2: 20, cal: { $0 + $1 })

print(sum)
