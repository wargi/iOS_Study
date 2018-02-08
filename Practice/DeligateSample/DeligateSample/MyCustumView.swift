//
//  MyCustumView.swift
//  DeligateSample
//
//  Created by 박소정 on 2018. 2. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MyCustumView: UIView {

    private var button:UIButton!
    var delegate:MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        button = UIButton()
        button.addTarget(self, action: #selector(self.btnHandler(_:)), for: .touchUpInside)
        button.setTitle("HiHi", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = self.bounds
        self.addSubview(button)
    }
    
    
    @objc func btnHandler(_ sender: UIButton) {
        print("버튼클릭")
        delegate?.didSelectedMyCustomView(self)
    }
}

protocol MyCustomViewDelegate {
    func didSelectedMyCustomView(_ customView:MyCustumView)
}
