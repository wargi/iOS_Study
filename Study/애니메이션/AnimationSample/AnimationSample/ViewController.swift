//
//  ViewController.swift
//  AnimationSample
//
//  Created by 박소정 on 2018. 3. 20..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animView: UIView!
    @IBOutlet weak var animViewBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animate(withDuration: 3) {
//            self.animViewBottomConstraint.constant += 200
//            self.view.layoutIfNeeded()
//        }
        
//        UIView.animate(withDuration: 3, delay: 3, options: [.repeat, .autoreverse], animations: {
//            self.animViewBottomConstraint.constant += 200
//            self.view.layoutIfNeeded()
//        })
        
        UIView.animate(
            
            withDuration: 2,
            delay: 2,
            usingSpringWithDamping: 0.1, // 0~1까지 0에 가까울 수록 더 격하게 움직인다.
            initialSpringVelocity: 1, //왔다갔다 하는 역할
            options: [],
            animations: {
//            self.animViewBottomConstraint.constant += 300
            self.animView.frame.origin.y -= 200
            self.view.layoutIfNeeded()
        })
        
//        UIView.animate(withDuration: 10, delay: 0, options: [.beginFromCurrentState], animations: {
//            var startTime = 0
//            var duration =
//            //0~2까지의 애니메이션
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2, animations: {
//                <#code#>
//            })
//            //2~4까지의 애니메이션
//            UIView.addKeyframe(withRelativeStartTime: 2, relativeDuration: 4, animations: {
//                <#code#>
//            })
//            //4~6까지의 애니메이션
//            UIView.addKeyframe(withRelativeStartTime: 4, relativeDuration: 6, animations: {
//                <#code#>
//            })
//        }) //completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#> 애니메이션이 끝나고 실행시킬 클로져
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

