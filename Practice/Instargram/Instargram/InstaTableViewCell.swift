//
//  InstaTableViewCell.swift
//  Instargram
//
//  Created by 박소정 on 2018. 2. 22..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class InstaTableViewCell: UITableViewCell {

    @IBOutlet var top : UILabel!
    @IBOutlet var likeBtn : UIButton!
    @IBOutlet var commentBtn : UIButton!
    @IBOutlet var shareBtn : UIButton!
    @IBOutlet var mainImgView : UIImageView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var bottom: UILabel!
    @IBOutlet var likeLB : UILabel!
    @IBOutlet weak var gps: UILabel!
    @IBOutlet weak var topImgView: UIImageView! 
    
    
    var mainImg:UIImage? {
        didSet {
            mainImgView.image = mainImg
        }
    }
    
    var topImg:UIImage? {
        didSet {
            topImgView.image = topImg
        }
    }
    
    var commentInput:String? {
        didSet {
            comment.text = commentInput
        }
    }
    
    var title:String? {
        didSet {
            top.text = title
            bottom.text = title
        }
    }
    
    var gpsText:String? {
        didSet {
            gps.text = gpsText
        }
    }
    
    var commentContents:String? {
        didSet {
            comment.text = commentContents
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        likeBtn.setImage(UIImage(named: "like_png"), for: .selected)
        likeBtn.addTarget(self, action: #selector(self.likeClickedEvent(_:)), for: .touchUpInside)
        commentBtn.setImage(UIImage(named: "comment"), for: .normal)
        shareBtn.setImage(UIImage(named: "share"), for: .normal)
        //이미지를 둥글게 만들기
//        commentTF.layer.cornerRadius =
//        commentTF.clipsToBounds = true
//        likeBtn.setImage(UIImage(named: "emptyLike"), for: .normal)
//        likeBtn.setImage(UIImage(named: "like_png"), for: .selected)
    }
    
    @objc func likeClickedEvent(_ sender : UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            likeLB.text = "좋아요"
        } else {
            sender.isSelected = true
            likeLB.text = "좋아요 1개"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
