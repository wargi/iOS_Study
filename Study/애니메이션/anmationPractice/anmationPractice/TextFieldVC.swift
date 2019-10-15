//
//  TextFieldVC.swift
//  anmationPractice
//
//  Created by 박소정 on 2018. 3. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController {

    @IBOutlet private weak var tf : UITextField!
    @IBOutlet private weak var centerConstraint : NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TextFieldVC: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let testBool = false
        
        if testBool {
            
        } else {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.04, // 0~1까지 0에 가까울 수록 더 격하게 움직인다.
                initialSpringVelocity: 1.5, //왔다갔다 하는 역할
                options: [],
                animations: {
                    self.centerConstraint.constant += 5
                    self.view.layoutIfNeeded()
                    self.centerConstraint.constant -= 5
                    self.view.setNeedsLayout()
            })
        }
        return true
    }
}

