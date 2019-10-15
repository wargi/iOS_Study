//
//  ViewController.swift
//  UIImagePickrerTest3
//
//  Created by 박소정 on 2018. 3. 14..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img : UIImage!
    let imgPicker = UIImagePickerController()
    @IBOutlet weak var collectionView: UICollectionView!
    var photoCollction: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addClicked(_:)))
    }
    
    @objc func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "사진 불러오기", message: "사진을 불러 올 저장소를 선택하세요", preferredStyle: .actionSheet)
        let photoAction = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.photo()
        }
        let libraryAction = UIAlertAction(title: "사진첩", style: .default) { (action) in
            self.library()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(photoAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func photo() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("카메라를 켤 수 없습니다.")
            return
        }
        imgPicker.sourceType = .camera
        
        present(imgPicker, animated: true, completion: nil)
        
        
    }
    
    func library() {
        imgPicker.sourceType = .photoLibrary
        
        present(imgPicker, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let newImg = info["UIImagePickerControllerOriginalImage"] as? UIImage else { return }
        
        photoCollction.append(newImg)
        self.collectionView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoCollction.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCustomCell
        cell.imgInput = photoCollction[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 125)
    }
    
    //셀의 테두리의 여백의 값
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //라인과 라인사이의 간격(라인에 표시 될 수 있는 컬렉션이 한정적이면 자동으로 거리가 조정되서 지금의 100이상이 될 수 있다)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //셀과 셀사이의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
