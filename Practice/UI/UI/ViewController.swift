//
//  ViewController.swift
//  UI
//
//  Created by 박소정 on 2018. 2. 7..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

