//
//  ViewController.swift
//  ViewControllerLifeCycle
//
//  Created by 박소정 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("WillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("WillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("DidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("WillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("DidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("=====================")
        print("DidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

