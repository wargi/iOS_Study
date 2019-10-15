//
//  ViewController.swift
//  anmationPractice
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. First
        UIView.animate(withDuration: TimeInterval(3), delay: 0, options: [.repeat, .autoreverse],
                       animations: {
            self.subView.frame.origin.y -= 100
            self.view.backgroundColor = .blue
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

