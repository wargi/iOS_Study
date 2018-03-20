//
//  ViewController.swift
//  UiImagePickerTest2
//
//  Created by 박소정 on 2018. 3. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imgView : UIImageView!
    @IBOutlet private weak var libraryView : UIView!
    let imgPicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let photoAddAction = UITapGestureRecognizer(target: self, action: #selector(self.addProfile(_:)))
        libraryView.isUserInteractionEnabled = true
        imgPicker.delegate = self
        self.libraryView.addGestureRecognizer(photoAddAction)
    }

    @objc func addProfile(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)) {
            imgPicker.allowsEditing = true
            imgPicker.sourceType = .photoLibrary
            self.present(imgPicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "에러", message: "접근이 불가능 합니다.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let newImg = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imgView.image = newImg
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
