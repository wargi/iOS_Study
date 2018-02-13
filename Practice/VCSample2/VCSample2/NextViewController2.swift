//
//  NextViewController2.swift
//  VCSample2
//
//  Created by 박소정 on 2018. 2. 8..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clickEvent(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
