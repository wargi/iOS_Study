//
//  MyCustomView.swift
//  DeligateSample
//
//  Created by 박소정 on 2018. 2. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCustomView: UIView, UITextFieldDelegate {

    var tf: UITextField!
    private var btn: UIButton!
    private var lb: UILabel!
    var lbtext:String {
        get{
            guard let str : String = lb.text else { return "값이 없습니다"}
            return str
        }
        set{
            lb?.text = newValue
        }
    }
    var delegate : MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create()
    {
        lb = UILabel()
        lb.textAlignment = .center
        lb.text = "입력값이 없습니다"
        lb.font = UIFont.systemFont(ofSize: 30)
        lb.layer.borderWidth = 1
        lb.textColor = .black
        lb.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height / 3)
        self.addSubview(lb)
        
        tf = UITextField()
        tf.frame = CGRect(x: 0, y: lb.bounds.height, width: self.bounds.width, height: self.bounds.height / 3)
        tf.layer.borderWidth = 1
        tf.textColor = .black
        tf.delegate = self
        self.addSubview(tf)
        
        btn = UIButton()
        btn.setTitle("버튼", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.frame = CGRect(x: 0, y: lb.bounds.height * 2, width: self.bounds.width, height: self.bounds.height / 3)
        btn.addTarget(self, action: #selector(self.clickedTouchUpInside(_:)), for: .touchUpInside)
        self.addSubview(btn)
        
    }
    
    @objc func clickedTouchUpInside(_ sender: UIButton) {
        print("Clicked")
        lb.text? = tf.text!
        delegate?.didSelectedMyCustomView(self)
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("textDelegate")
        return true
    }
}

protocol MyCustomViewDelegate {
    func didSelectedMyCustomView(_ MyCustom : MyCustomView)
}
