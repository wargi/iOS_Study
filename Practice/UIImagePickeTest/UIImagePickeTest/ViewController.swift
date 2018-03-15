//
//  ViewController.swift
//  UIImagePickeTest
//
//  Created by 박소정 on 2018. 3. 13..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imgView : UIImageView!
    let imgPicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addEvent(_:)))
        imgPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func addEvent(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "테스트", message: "안녕하세요", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진 앨범", style: .default) { (action) in
            self.openLibrary()
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary() {
        imgPicker.sourceType = .photoLibrary
        
        present(imgPicker, animated: true, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imgPicker.sourceType = .camera
            
            present(imgPicker, animated: false, completion: nil)
        }
        else {
            print("Camera not available")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imgView.image = img
            
        }
        
        dismiss(animated: true, completion: nil)
    }
}

