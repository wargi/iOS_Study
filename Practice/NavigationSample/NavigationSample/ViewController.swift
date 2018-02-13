//
//  ViewController.swift
//  NavigationSample
//
//  Created by 박소정 on 2018. 2. 9..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인 페이지"
        let leftItem : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.leftAction(_:)))
        let rightItem : UIBarButtonItem = UIBarButtonItem(title: "회원가입", style: .done, target: self, action: #selector(self.rightAction(_:)))
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func leftAction(_ sender : UIButton) {
        
    }
    
    @objc func rightAction(_ sender : UIButton) {
        
    }
    
    @IBAction func action(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        self.navigationController?.pushViewController(nextVC!, animated: true)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

