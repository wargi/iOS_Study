//
//  ViewController.swift
//  fileTrans
//
//  Created by 박소정 on 2018. 3. 13..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

/*
 1. 뷰컨트롤러간에 화면 전환 할 때 애니메이션 등을 구현 해보기 ()
 2. UIImagePickerController를 이용해셔 이미지 저장하고 불러오기
 3. 어떤 부분에는 좌, 우 스크롤 어떠부분 상, 하 스크롤 해보기
 4. 프로젝트 할 때는 이쁜 디자인으로 만들기
 5. 
 */


import UIKit

class ViewController: UIViewController {

    let documentInteration = UIDocumentInteractionController()
    
    final class DocumentInteractionViewController: UIViewController {
        
        //UIDocumentInteractionController 파일전송 해주는 컨트롤러
        lazy var docInteractionVC: UIDocumentInteractionController = {
            //url 번들에 있는 파일을 받아서 넘겨주는 역할
            let url = Bundle.main.url(forResource: "iPhone", withExtension: "png")!
            
            let vc = UIDocumentInteractionController(url: url)
            
            vc.delegate = self as? UIDocumentInteractionControllerDelegate
            return vc
        }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupinteractionController()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupinteractionController() {
        documentInteration.url = Bundle.main.url(forResource: "iPhone", withExtension: "png")
        documentInteration.delegate = self
        
    }
    
    @IBAction private func filePreView(_ sender: Any) {
        documentInteration.presentPreview(animated: true)
    }

    @IBAction private func sendFile(_ sender: Any) {
        documentInteration.presentOptionsMenu(from: .zero, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    extension DocumentInteractionViewController: UIDocumentInteractionControllerDelegate {

        func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
            return self
        }
        
        

}

