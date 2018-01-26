//
//  main.swift
//  Test
//
//  Created by 박소정 on 2018. 1. 25..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

print("Hello, World!")


//
//  Optional.swift
//  ClassTest
//
//  Created by 박소정 on 2018. 1. 25..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import Foundation

struct AClass {
    
    var bInstance: BClass?
}

struct BClass {
    
    var cInstance: CClass?
}

struct CClass {
    var result: Int?
    
    func foo() {
        
    }
}


let c = CClass(result: 10)
let b = BClass(cInstance: c)
let a = AClass(bInstance: b)

if let bOptional = a.bInstance {
    
    if let cOptional = bOptional.cInstance {
        
        if let resultValue = cOptional.result {
            print(resultValue)
        }
    }
}

if let resultValue = a.bInstance?.cInstance?.result {
    
}

let fun = a.bInstance?.cInstance?.foo



let foo = Int("sdf")











