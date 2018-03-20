//
//  ViewController.swift
//  ArrayF
//
//  Created by 박상욱 2018. 1. 19..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var arra : [Int] = [1,2,1,2,3]
        let arr : ArrayF = ArrayF()
        arr.arrayTest1()

        arr.arrayTest2()
        arr.setTest()
        arr.dictionaryTest()
        arra = arr.setToArr(arr: arra)
        print(arra)
        var arrA : [Int] = [1,4,2,3]
        arrA = arr.arrSort(arr: arrA)
        print(arrA)
        let arrAr : [Any] = arr.arrAddArray(arr: arrA)
        print(arrAr)
        arrA = arr.eratos(number: 10000)
        print(arrA)
        }

    //MARK: Hi
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


