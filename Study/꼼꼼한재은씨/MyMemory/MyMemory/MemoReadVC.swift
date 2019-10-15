//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 박소정 on 2018. 3. 17..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    
    var param: MemoData?
    @IBOutlet private weak var subject : UILabel!
    @IBOutlet private weak var contents : UILabel!
    @IBOutlet private weak var imgView : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subject.text = param?.title
        self.contents.text = param?.contents
        self.imgView.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        
        let dataString = formatter.string(from: (param?.regdate)!)
        
        self.navigationController?.title = dataString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
