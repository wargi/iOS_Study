//
//  SubScriptClass.swift
//  SubscriptSample
//
//  Created by 박소정 on 2018. 3. 2..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class SubScriptClass {
    let cols : Int
    let rows : Int
    var grid : [Double]
    
    init(cols: Int, rows: Int) {
        self.cols = cols
        self.rows = rows
        self.grid = Array(repeating: 0.0, count: rows * cols)
    }
    subscript(row : Int, col : Int) -> Double {
        get {
            return grid[(row * col) + col]
        }
        set {
            grid[(row * cols) + col] = newValue
        }
    }
}

class Stack<S> {
    var stackArr:[S] = []
    
    func push(temp : S) {
        stackArr.append(temp)
    }
    
    func pop() -> S {
        return stackArr.popLast()!
    }
}

class Queue<Q> {
    var queueArr:[Q] = []
    
    func enque(temp : Q) {
        queueArr.append(temp)
    }
    
    func deque() -> Q {
        return queueArr.removeFirst()
    }
}

class EqulAToB<T: Equatable> {
    var first : T
    var second : T
    
    init(A : T, B : T) {
        self.first = A
        self.second = B
        
    }
    func equal() -> Bool {
        if first == second {
            return true
        }
        else {
            return false
        }
    }
    
}

