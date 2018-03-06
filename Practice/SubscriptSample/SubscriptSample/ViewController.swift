//
//  ViewController.swift
//  SubscriptSample
//
//  Created by 박소정 on 2018. 3. 2..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stack: Stack<Int> = Stack<Int>()
        let queue: Queue<Int> = Queue<Int>()
        
        let arrTemp = [1,2,3,4,5]
        
        let equal: Bool = EqulAToB<Int>(A: 10, B: 10).equal()
        
        
        let sub = SubScriptClass(cols: 2, rows: 2)
        sub[0,0] = 1
        print(sub[0,0])
        sub[0,1] = 2.5
        print(sub[0,1])
        
        let numberTemp = 123
        
        print(numberTemp[3])
        
        
        for index in arrTemp {
            stack.push(temp: index)
            queue.enque(temp: index)
        }
        print(stack.stackArr)
        print(queue.queueArr)
        
        print(stack.pop())
        print(queue.deque())
        print(stack.stackArr)
        print(queue.queueArr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Int {
    subscript (number: Int) -> Int {
        var temp = self
        for _ in 0..<number {
            temp = temp / 10
        }

        return temp % 10
    }
}

