//
//  NextViewController.swift
//  NavigationSample
//
//  Created by 박소정 on 2018. 2. 9..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @objc func backBtn(_ sender : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "두번쨰 페이지"
        
        let item : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "AppleLogo"), style: .plain, target: self, action: #selector(self.backBtn(_:)))
        self.navigationItem.rightBarButtonItem = item
        
        
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
