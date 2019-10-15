//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 박소정 on 2018. 3. 17..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {

    @IBOutlet var contents : UITextView!
    @IBOutlet var preview : UIImageView!
    let imgPicker = UIImagePickerController()
    var subject: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgPicker.delegate = self
        self.imgPicker.allowsEditing = true
        self.contents.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func save(_ sender: Any) {
        guard self.contents.text.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func pick(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "이미지를 가져올 곳을 선택해 주세요.", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "카메라", style: .default, handler: { (action) in
            self.camera()
        }))
        
        alert.addAction(UIAlertAction(title: "저장앨범", style: .default, handler: { (action) in
            self.library()
        }))
        alert.addAction(UIAlertAction(title: "사진 라이브러리", style: .default, handler: { (action) in
            self.Photolibrary()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func camera() {
        imgPicker.sourceType = .camera
    }
    
    func library() {
        imgPicker.sourceType = .savedPhotosAlbum
    }
    
    func Photolibrary() {
        imgPicker.sourceType = .savedPhotosAlbum
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let img = info[UIImagePickerControllerEditedImage] as? UIImage else {
            print("Error")
            return
        }
        self.preview.image = img
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension MemoFormVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
    }
}
