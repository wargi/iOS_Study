//
//  NextViewController.swift
//  ViewControllerLifeCycle
//
//  Created by 박소정 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("=====================")
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

}
