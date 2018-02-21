//
//  NextViewController.swift
//  TableViewTest
//
//  Created by 박소정 on 2018. 2. 21..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    let nextLB = UIButton()
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextLB.frame = CGRect(x: (view.bounds.width / 2) - 50, y: (view.bounds.height / 2) - 50, width: 100, height: 100)
        nextLB.titleLabel?.textAlignment = .center
        nextLB.setTitle(text, for: .normal)
        nextLB.setTitleColor(.black, for: .normal)
        nextLB.layer.borderWidth = 1
        nextLB.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        nextLB.addTarget(self, action: #selector(self.clickedEvent(_:)), for: .touchUpInside)
        view.addSubview(nextLB)
        
    }
    
    @objc func clickedEvent(_ sender : UIButton) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerNext") as! ViewControllerNext
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
