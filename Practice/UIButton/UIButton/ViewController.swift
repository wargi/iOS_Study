//
//  ViewController.swift
//  UIButton
//
//  Created by 박소정 on 2018. 2. 15..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myCustumBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCustumBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myCustumBtn.setTitle("버튼입니다", for: .normal)
        myCustumBtn.setTitleColor(.red, for: .normal)
        myCustumBtn.setBackgroundImage(
            UIImage(named:"Logo.jpeg"),
            for: UIControlState.normal)
        myCustumBtn.setTitle("누른상태입니다.", for: .selected)
        myCustumBtn.setTitleColor(.black, for: .selected)
        myCustumBtn.titleLabel?.font =
            UIFont.systemFont(ofSize: 30)
        myCustumBtn.backgroundColor = .black
        myCustumBtn.addTarget(self, action:
            #selector(self.clickEvent(_:)), for: .touchUpInside)
        myCustumBtn.isEnabled = true
        self.view.addSubview(myCustumBtn)
    }

    @objc func clickEvent(_ sender : UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
        sender.isSelected = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

