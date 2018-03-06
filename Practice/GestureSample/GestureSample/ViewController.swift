//
//  ViewController.swift
//  GestureSample
//
//  Created by 박소정 on 2018. 3. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet var titleLb: UILabel!
    @IBOutlet var bottomLb: UILabel!
    @IBOutlet var previousLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLb.text = "횟수 : 0"
        bottomLb.text = "(,)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func taptap(_ sender: UITapGestureRecognizer)
    {
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        titleLb.text = "횟수 : " + "\(touch.tapCount)"
        
        bottomLb.text = "현재 위치 : \(touch.location(in: touch.view).x),\(touch.location(in: touch.view).y)"
        
        previousLB.text = "이전 위치 : \(touch.previousLocation(in: touch.view).x),\(touch.previousLocation(in: touch.view).y)"
        return true
    }
}

