//
//  ViewController.swift
//  AnimationSample2
//
//  Created by 박소정 on 2018. 3. 20..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var btn0 : UIButton!
    @IBOutlet private weak var btn00 : UIButton!
    var lfBtnArr: [UIButton] = []
    var rtBtnArr: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn0.backgroundColor = .red
        btn0.layer.cornerRadius = btn0.frame.size.width/2
        btn0.clipsToBounds = true
        btn0.addTarget(self, action: #selector(self.leftClickEvent(_:)), for: .touchUpInside)
        
        btn00.backgroundColor = .black
        btn00.layer.cornerRadius = btn0.frame.size.width/2
        btn00.clipsToBounds = true
        btn00.addTarget(self, action: #selector(self.rightClickEvent(_:)), for: .touchUpInside)
        
        create()
    }

    func create() {
        for _ in 0..<5 {
            lfBtnArr.append(UIButton())
            rtBtnArr.append(UIButton())
        }
        
        for n in 0..<5 {
            lfBtnArr[n].frame = btn0.frame
            lfBtnArr[n].setTitle("버튼" + String(n + 1), for: .normal)
            lfBtnArr[n].layer.cornerRadius = btn0.frame.size.width / 2
            lfBtnArr[n].clipsToBounds = true
            lfBtnArr[n].isHidden = true
            lfBtnArr[n].backgroundColor = color(num: n)
            self.view.addSubview(lfBtnArr[n])
            
            rtBtnArr[n].frame = btn0.bounds
            rtBtnArr[n].layer.cornerRadius = btn0.frame.size.width / 2
            rtBtnArr[n].clipsToBounds = true
            rtBtnArr[n].isHidden = true
            rtBtnArr[n].backgroundColor = color(num: n)
            self.view.addSubview(rtBtnArr[n])
            
            
        }

    }
    
    @objc func leftClickEvent(_ sender: UIButton) {
        
        if sender.isSelected {
            UIButton.animate(withDuration: 0.5, animations: {
                let frame = self.btn0.frame
                for btn in self.lfBtnArr {
                    btn.frame = frame
                    
                }
                self.view.bringSubview(toFront: self.btn0)
                self.view.layoutIfNeeded()
            })
            sender.isSelected = false
        } else {
            UIButton.animate(withDuration: 0.5, animations: {
                var start = self.btn0.frame.origin.y - 60
                for btn in self.lfBtnArr {
                    btn.frame.origin.y = start
                    btn.isHidden = false
                    start -= 60
                }
                self.view.layoutIfNeeded()
            })
            sender.isSelected = true
        }
        
    }
    
    func color(num: Int) -> UIColor {
        switch num {
        case 0:
            return UIColor.brown
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.gray
        case 3:
            return UIColor.cyan
        default:
            return UIColor.lightGray
        }
    }
    
    @objc func rightClickEvent(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

