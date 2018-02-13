//
//  NextViewController.swift
//  VCSample2
//
//  Created by 박소정 on 2018. 2. 8..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
    @IBAction func action(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
