//
//  ViewController.swift
//  AutoLaoutSample
//
//  Created by 박소정 on 2018. 3. 19..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var txt : UITextField!
    @IBOutlet private weak var placeholderLabel : UILabel!
    @IBOutlet private weak var nextButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func underlineStyleByProgrammaticallyExamply() {
//        let buttonTitle = nextButton.title(for: .normal)
//        let mutableAttrStr = NSMutableAttributedString(string: buttonTitle)
//        let attrKeys: [NSAttributedStringKey: Any] = [
//            .underLineStyle: NSUnderlineStyle.styleSingle.rawValue,
//            .underLineColor: UIColor.darkGray
//        ]
//        mutableAttrStr.addAttributes(attrKeys, range: NSRange(location: 0, length: buttonTitle.count))
//        next.Button.setAttributedTitle(mutableAttrStr, for: .normal)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text ?? ""
        let replace = (text as NSString).replacingCharacters(in: range, with: string)
        
        placeholderLabel.text = replace.isEmpty ? "your-url.slack.com" : ".slack.com"
        nextButton.isSelected = !replace.isEmpty
        
        let attrKey = [NSAttributedStringKey.font: textField.font!]
        let textWidthSize = (replace as NSString).size(withAttributes: attrKey).width
//        placeholderLabelLeadingConstraint.constant = textWidthSize
        
        
        print(replace)
        
        
        return true
    }
    
}


