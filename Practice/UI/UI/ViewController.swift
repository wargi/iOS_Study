//
//  ViewController.swift
//  UI
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sub:SubJect = SubJect(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(sub)
        
        
        sub.addTarget(self, action: #selector(self.clickedEvent(_:)), for: .touchUpInside)
        
    }

    @objc func clickedEvent(_ sender : UIButton) {
        print("touch")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

