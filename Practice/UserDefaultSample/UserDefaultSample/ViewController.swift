//
//  ViewController.swift
//  UserDefaultSample
//
//  Created by 박소정 on 2018. 2. 9..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

let key = "UserNameList"

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTF: UITextField!
    @IBOutlet weak var firstTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let path = Bundle.main.path(forResource: "UserList", ofType: "plist")
//        let userList = NSDictionary(contentsOfFile: path!)
//        print(userList!)
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        
        var listArray = UserDefaults.standard.array(forKey: key) as? [Dictionary<String, String>]
        if var list = UserDefaults.standard.dictionary(forKey: key) as? [String : String] {
            list = [firstTF.text! : mainTF.text!]
//            listArray.append(list)
            UserDefaults.standard.set(listArray, forKey: key)
        } else {
            let newNameList = [firstTF.text! : mainTF.text!]
            UserDefaults.standard.set(newNameList, forKey: key)
        }
    }
    @IBAction func printAction(_ sender: Any) {
        if var list = UserDefaults.standard.dictionary(forKey: key) as? [String : String] {
            for (ID,PW) in list {
                //                if firstTF.text == ID
                //                {
                //                    print(ID,PW)
                //                }
                //                else {
                //                    print("없다")
                //                }
                print("ID = ", ID, "PW = ", PW)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

