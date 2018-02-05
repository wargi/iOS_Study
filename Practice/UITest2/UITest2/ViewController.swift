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
        
        let myC : MyCustomView = MyCustomView(frame: CGRect(x: 15, y: 15, width: view.bounds.width, height: view.bounds.height))

        self.view.addSubview(myC)
        
        myC.addTarget(self, action: #selector(clickEvent(_:)), event: .touchUpInside)
        //글꼴 목록 호출
//        printAllFontName()
    }
    
    @objc func clickEvent(_ sender: UIButton) {
        let str : String = "버튼을 선택 하셨습니다."
        switch sender.tag {
        case 0:
            
        case 1:
            mainLB.text = lableArray[sender.tag].text! + str
        case 2:
            mainLB.text = self.lableArray[sender.tag].text! + str
        case 3:
            mainLB.text = self.lableArray[sender.tag].text! + str
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

