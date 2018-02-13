//
//  ViewController.swift
//  UITest2
//
//  Created by 박소정 on 2018. 2. 2..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var count : Int?
        let myC : MyCustomView = MyCustomView(frame: CGRect(x: 15, y: 15, width: view.bounds.width, height: view.bounds.height))
        let str : String = "버튼을 선택 하셨습니다."
        self.view.addSubview(myC)
        
        
        //글꼴 목록 호출
//        printAllFontName()
        switch count! {
        case 0:
            myC.mainLBTitle = myC.lableArray[count!].text! + str
        case 1:
            myC.mainLBTitle = myC.lableArray[count!].text! + str
        case 2:
            myC.mainLBTitle = myC.lableArray[count!].text! + str
        case 3:
            myC.mainLBTitle = myC.lableArray[count!].text! + str
        default:
            return
        }
    }
    
    //추가된 글꼴 확인 함수
    func printAllFontName()
    {
        let familyNames = UIFont.familyNames
        for fn in familyNames
        {
            print("====\(fn)====")
            
            let fontNames = UIFont.fontNames(forFamilyName: fn)
            for fontName in fontNames
            {
                print("ㄴ>>\(fontName)")
            }
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

