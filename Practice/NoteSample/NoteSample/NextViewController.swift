//
//  NextViewController.swift
//  NoteSample
//
//  Created by 박소정 on 2018. 2. 26..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mainTF: UITextField!
    let imgBack:UIImage = UIImage(named: "MemoBack")!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTF.delegate = self
        mainTF.background = imgBack
        self.navigationItem.title = "메모장"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(self.clickedEvent(_:)))
    }

    @objc func clickedEvent(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Noti"), object: mainTF.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainTF.resignFirstResponder()
        return true
    }
}
