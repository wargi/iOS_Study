//
//  ViewController.swift
//  DeligateSample
//
//  Created by 박소정 on 2018. 2. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyCustomViewDelegate, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myC = MyCustomView(frame : CGRect(x: self.view.frame.maxX / 2 - 150, y: self.view.frame.maxY / 2 - 150, width: 300, height: 300))
        myC.delegate = self
        myC.clipsToBounds = true
        self.view.addSubview(myC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x,scrollView.contentOffset.y)
    }
    
    func didSelectedMyCustomView(_ MyCustom: MyCustomView) {
        print(MyCustom.lbtext)
    }
}

