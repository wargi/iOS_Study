//
//  ViewController.swift
//  VCSample2
//
//  Created by 박소정 on 2018. 2. 8..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let nextVC = NextViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        
        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = mainStory.instantiateViewController(withIdentifier: "VC2") as! NextViewController2
        self.present(nextViewController, animated: true, completion: nil)
        nextViewController.modalTransitionStyle = .flipHorizontal
    }
    
    @IBAction func action(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "확인", message: "작성하신 정보가 맞습니까?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "네", style: .default) { (action) in
            //해당 버튼이 클릭되면 해야 될 행동
            self.present(self.nextVC, animated: true, completion: nil)
            self.nextVC.modalTransitionStyle = .partialCurl

        }
        let action2 = UIAlertAction(title: "아니오", style: .destructive) { (action) in
            //
        }
        
        let action3 = UIAlertAction(title: "음,.", style: .cancel) { (action) in
            //
        }
        alertVC.addAction(action3)
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        self.present(alertVC, animated: true, completion: nil)
        
        }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "" {
            
            return false
        }
        else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextVC = segue.destination as? NextViewController3{
            nextVC.title = self.title
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

