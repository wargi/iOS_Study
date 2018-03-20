//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 박소정 on 2018. 3. 18..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        btn.addTarget(self, action: #selector(self.clickBtnEvent(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func clickBtnEvent(_ sender: UIButton) {
        sender.setTitle("클릭되었습니다.", for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

