//
//  ViewController.swift
//  NotiSample
//
//  Created by 박소정 on 2018. 2. 23..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.notiAction(_:)), name: NSNotification.Name(rawValue: "notiKey"), object: nil)

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "notiKey"), object: nil, queue: nil) { (noti) in
            
            guard let text = noti.object as? String else { return }
            self.titleLB.text = text
            print("노티에게 연락옴")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

//    @objc func notiAction(_ noti: Notification)
//    {
//        let msg = noti.object as! String
//        titleLB.text = msg
//        print("노티에게 연락옴")
//    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "notiKey"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

