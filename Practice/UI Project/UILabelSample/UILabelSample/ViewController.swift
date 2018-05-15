//
//  ViewController.swift
//  UILabelSample
//
//  Created by 박소정 on 2018. 2. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myCustumLB : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustumLB = UILabel(frame:
            CGRect(x: 0, y: 100, width: view.bounds.width, height: 100))
        myCustumLB.text =
                        """
                        안녕하세요
                        제 이름은
                        박상욱입니다.
                        """
        myCustumLB.textAlignment = .center
        myCustumLB.font = UIFont.systemFont(ofSize: 20)
        myCustumLB.isHighlighted = true
        myCustumLB.numberOfLines = 0
        myCustumLB.shadowColor = UIColor.brown
        myCustumLB.lineBreakMode = .byCharWrapping
        myCustumLB.shadowOffset = CGSize(width: 5, height: 5)
        myCustumLB.backgroundColor = .black
        myCustumLB.textColor = .white
//        myCustumLB.highlightedTextColor = .red
        self.view.addSubview(myCustumLB)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

