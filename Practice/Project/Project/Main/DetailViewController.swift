//
//  DetailViewController.swift
//  Project
//
//  Created by 박소정 on 2018. 2. 28..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var backImg:UIImageView!
    @IBOutlet var profileImg:UIImageView!
    @IBOutlet var name:UILabel!
    @IBOutlet var introduce:UILabel!
    @IBOutlet var phone:UILabel!
    @IBOutlet var email:UILabel!
    
    var userData:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = userData
        {
            backImg.image = UIImage(named: data.bgImgUrl)
            profileImg.image = UIImage(named: data.profileImgUrl)
            name.text = data.nickname
            introduce.text = data.profileDescription
            phone.text = data.phonNumber
            email.text = data.email
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        profileImg.clipsToBounds = true
        profileImg.layer.borderColor = UIColor.black.cgColor
        profileImg.layer.borderWidth = 0.3
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
