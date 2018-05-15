//
//  DetailViewController.swift
//  MainProject
//
//  Created by youngmin joo on 2018. 2. 28..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var userData:UserModel?
    
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var nickNameLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    
    @IBOutlet weak var phoneNumLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userData = userData
        {
            //UI Data Update
            bgImgView.image = UIImage(named:userData.bgImgUrl)
            profileImgView.image = UIImage(named:userData.profileImgUrl)
            nickNameLb.text = userData.nickName
            descriptionLb.text = userData.profileDescription
            phoneNumLb.text = userData.phoneNumber
            emailLb.text = userData.email
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImgView.layer.cornerRadius = profileImgView.frame.size.width/2
        profileImgView.clipsToBounds = true
        profileImgView.layer.borderColor = UIColor.black.cgColor
        profileImgView.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
