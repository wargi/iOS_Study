//
//  NextViewController.swift
//  NotiSample
//
//  Created by 박소정 on 2018. 2. 23..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var TF : UITextField!
    @IBAction func btn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notiKey"), object: TF.text)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
