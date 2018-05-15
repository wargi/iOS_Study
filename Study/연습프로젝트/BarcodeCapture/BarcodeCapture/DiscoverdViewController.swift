//
//  DiscoverdViewController.swift
//  BarcodeCapture
//
//  Created by 박소정 on 2018. 3. 24..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DiscoverdViewController: UIViewController {

    private var barcode: String?
    
    var inputBarcode: String? {
        willSet{
            barcode = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(barcode!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
