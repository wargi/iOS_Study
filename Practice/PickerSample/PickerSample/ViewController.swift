//
//  ViewController.swift
//  PickerSample
//
//  Created by 박소정 on 2018. 3. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var myCustumPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCustumPicker = UIPickerView()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
}

