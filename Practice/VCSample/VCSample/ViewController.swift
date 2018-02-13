//
//  ViewController.swift
//  VCSample
//
//  Created by 박상욱 on 2018. 2. 8..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard = UIStoryboard(name: "Main.storyboard", bundle: nil)
        
        let nextVC2 = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        self.present(nextVC2, animated: true, completion: nil)
        
    }
    @IBAction func action(_ sender: Any) {
        
        let nextVC = NextViewController()
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

