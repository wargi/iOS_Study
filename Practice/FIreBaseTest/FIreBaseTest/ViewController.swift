//
//  ViewController.swift
//  FIreBaseTest
//
//  Created by 박소정 on 2018. 3. 17..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet private weak var nameTf : UITextField!
    @IBOutlet private weak var valueTf : UITextField!
    @IBOutlet private weak var deleteItem : UITextField!
    @IBOutlet private weak var inputTf : UITextField!
    @IBOutlet private weak var input2Tf : UITextField!
    @IBOutlet private weak var result : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
//        ref.child("JSON").observeSingleEvent(of: .value, with: <#T##(DataSnapshot) -> Void#>)
        // Do any additional setup after loading the view, typically from a nib.
        
        ref.observe(.childAdded, with: { DataSnapshot in
            print("Item Added")
            self.result.text = DataSnapshot.value as? String
        })
        
        ref.observe(.childRemoved) { DataSnapshot in
            print("Item Removed")
        }
        
        ref.observe(.childChanged) { DataSnapshot in
            print("Item Changed")
        }
        
        
    }
    
    @IBAction private func insertBtnAction(_ sender: UIButton) {
        let itemsRef = ref.child((nameTf.text?.lowercased())!)
        itemsRef.setValue(valueTf.text)
        
        
        nameTf.text = ""
        valueTf.text = ""
        
    }
    
    @IBAction private func deleteBtnAction(_ sender: UIButton) {
        ref.child(deleteItem.text!).removeValue(completionBlock: { (error, ref) in
            if error != nil {
                print("error \(String(describing: error))")
            }
            
            self.deleteItem.text = ""
        })
    }
    
    @IBAction private func selectBtnAction(_ sender: UIButton) {
        ref.child(inputTf.text!).observeSingleEvent(of: .value, with: { (DataSnapshot) in
            let value = DataSnapshot.value as? String
            let name = value
            
            print("Name : " + name!)
            
            self.input2Tf.text = value
        })
    }
}

