//
//  ViewController.swift
//  DocumentInteractionViewController
//
//  Created by giftbot on 2018. 3. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

/***************************************************
 UIDocumentInteractionController
 - 내 앱에서 직접 다룰 수 없는 포맷을 가진 파일들에 대해 미리 보기, 열기, 출력 등을 할 수 있게 해주는 컨트롤러
 
 [ 타겟 문서 속성에 접근 ]
 var url: URL?        // 로컬 파일시스템의 타겟 파일 URL
 var uti: String?     // 타겟 파일의 타입
 var name: String?    // 타겟 파일의 이름
 var icons: [UIImage]   // 타겟 파일과 관련된 이미지들
 var annotation: Any?   // 타겟파일의 커스텀 속성 정보 목록
 
 [ 프리뷰 ]
 presentPreview  /  dismissPreview
 
 [ 트랜지션 ]
 presentOptionsMenu
 presentOptionMenu
 presentOpenInmenu
 dismissMenu
 ***************************************************/

final class DocumentInteractionViewController: UIViewController {
  
    //UIDocumentInteractionController 파일전송 해주는 컨트롤러
  lazy var docInteractionVC: UIDocumentInteractionController = {
    //url 번들에 있는 파일을 받아서 넘겨주는 역할
    let url = Bundle.main.url(forResource: "iPhone", withExtension: "png")!
    
    let vc = UIDocumentInteractionController(url: url)
    
    vc.delegate = self
    return vc
  }()
  
    //네비게이션 우측에 있는 공유 버튼 생성
  @IBOutlet private weak var shareBarButtonItem: UIBarButtonItem!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //NSTemporaryDirectory에 파일을 만들어주는 명령어
//    let filePath = NSTemporaryDirectory() + "test.txt"
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/test.txt"
    print(filePath)
    do {
//      try ("Some Text Data" as NSString).write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8.rawValue)
        try "Some Text Data" .write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
      print(error.localizedDescription)
    }
  }
  
    //알아야 할 부분 2: 프리뷰
  @IBAction private func filePreview(_ sender: Any) {
//    프리뷰버튼을 눌렀을때 텍스트를 호출
    let filePath = NSTemporaryDirectory() + "test.txt"
    docInteractionVC.url = URL(fileURLWithPath: filePath)
    
//프리뷰버튼을 눌렀을때 사진을 호출(movie.jpeg)
//    docInteractionVC.url = Bundle.main.url(forResource: "movie", withExtension: "jpeg")
    docInteractionVC.presentPreview(animated: true)
  }
  
  /***************************************************
   presentOptionsMenu
   - 현재 문서에서 수행할 수 없는 옵션은 메뉴에 포함되지 않음. 알려진 모든 앱에서 문서를 열 수 없다면 메뉴에 문서를 여는 옵션이 없게 됨.
   - 옵션 수행 가능 여부는 다음 3가지에 의해 결정됨
   The type of the document (as specified by the uti property)
   The set of installed apps that have registered support for opening documents
   The actions that you have indicated as supported in the document interaction controller delegate’s documentInteractionController:canPerformAction: method
   - 옵션 메뉴를 비동기적으료 표시하며, 메뉴들은 유저가 특정 메뉴를 선택하거나 메뉴뷰 밖을 터치하면 자동으로 닫힌다.
   - 현재 문서를 열 수 있는 앱 목록만 제공하기 위해서는 openInMenu 를 사용
   ex)
   // 앱 - 카카오톡, message, mail, 메모에 추가, sendAnywhere, slack 등등 ~~~
   // 가능 옵션 - Save Image, Assign to Contact, Copy, Print, 파일에 저장, 시계 페이스 생성, Quick Look, 기타
   
   presentOpenInMenu
   - presentOptionsMenu 와 유사하지만, 현재 문서를 열 수 있는 앱 목록으로 제한된 메뉴를 제공.
   - 이것은 (uti 속성에 표시된) document type 과 설치된 앱들의 지원 문서 유형에 따라 결정됨.
   - 하나 이상의 문서 유형을 지원하려면 앱이 CFBundleDocumentTypes 키를 사용하여 Info.plist 파일에 해당 유형을 등록하여야 함
   ex)
   // 앱 - 카카오톡, 메모에 추가, SendAnywhere, Slack, iTunes U, 드라이브 등 optionsMenu 에 비해 적은 수의 앱만 표시
   // 가능 옵션 - 파일에 저장, 시계 페이스 생성, 기타
   
   중요
   - iPhone 에서는 modal 형식으로만 띄워짐.
   아래와 같이 view의 위치와 크기를 지정하는 메서드 iPad 에서만 popOver 형태로서 사용됨.
   presentOpenInMenu(from: .zero, in: view, animated: true)
   ***************************************************/
  
  @IBAction private func sendFile(_ sender: Any) {
    /***************************************************
     Bundle 에 있는 파일을 데이터 컨테이너 디렉토리 중 하나로 옮긴 뒤 전송
     ***************************************************/
    
    // image
    
    let filePath = NSTemporaryDirectory() + "iPhone.png"
    do {
        // 번들에 있는 내용을 데이터컨테이너에 저장해주는 역할
      let data = try Data(contentsOf: Bundle.main.url(forResource: "iPhone", withExtension: "png")!)
      print(FileManager.default.createFile(atPath: filePath, contents: data, attributes: nil))
      // 전송에 성공하면 임시로 만든 파일 삭제
    } catch {
      print(error.localizedDescription)
    }
    // 알아야 할 부분 3: 데이터 오픈하는 부분
    // 데이터컨테이너에 넣어주고 난후 어떤 종류의 파일이다라고 가르쳐준다.
    docInteractionVC.url = URL(fileURLWithPath: filePath)
    docInteractionVC.uti = "public.png"
  
    // text
//    let filePath = NSTemporaryDirectory() + "test.txt"
//    docInteractionVC.url = URL(fileURLWithPath: filePath)
//    docInteractionVC.uti = "public.text"
    
    //
    docInteractionVC.name = "sendFileTest"
    //아이폰에 맞춰서 띄워주며 아이패드에는 다르게 나온다.
    docInteractionVC.presentOptionsMenu(from: .zero, in: view, animated: true)
    //    docInteractionVC.presentOpenInMenu(from: shareBarButtonItem, animated: true)
  }
}


// MARK: - UIDocumentInteractionControllerDelegate

extension DocumentInteractionViewController: UIDocumentInteractionControllerDelegate {
  
  // MARK: Preview
  /***************************************************
   ViewControllerForPreview -> ViewForPreview -> RectForPreview -> willBeginPreview 순으로 호출됨.
   ViewControllerForPreview 만 필수 메서드이며 나머지 둘은 옵셔널
   ***************************************************/
  func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
    // documentInteractionController 의 부모 뷰컨트롤러 지정.
    // NavgiationController 를 지정하면 push 형태. 아니면 modal 형태로 나타남
    print("\n-------------------- [ ViewControllerForPreview ] --------------------\n")
    return self
  }
  func documentInteractionControllerViewForPreview(_ controller: UIDocumentInteractionController) -> UIView? {
    print("\n-------------------- [ ViewForPreview ] --------------------\n")
    return view
  }
  func documentInteractionControllerRectForPreview(_ controller: UIDocumentInteractionController) -> CGRect {
    print("\n-------------------- [ RectForPreview ] --------------------\n")
    return view.bounds
  }
  func documentInteractionControllerWillBeginPreview(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ willBeginPreview ] --------------------\n")
  }
  func documentInteractionControllerDidEndPreview(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ diEndPreview ] --------------------\n")
  }
  
  
  // MARK: SendingFile
  /***************************************************
   파일 전송 시 호출 순서
   1) WillPresentOptionsMenu (or OpenInMenu)
   2) WillBeginSendingToApplication
   3) DidDismissOptionsMenu (or OpenInMenu)
   4) DidDismissOpenInMenu
   ***************************************************/
  
  func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?) {
    print("\n-------------------- [ willBeginSendingToApplication ] --------------------\n")
    print(controller.url) //어디서 보내는지
    print(controller.uti ?? "unknown") // 보내는 파일 uti
    print(application ?? "unknown") // 받는 앱의 bundle-id //어느 앱에 나타내는 지
    
  }
  func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
    print("\n-------------------- [ didEndSendingToApplication ] --------------------\n")
  }

  // MARK: OpenInMenu

  func documentInteractionControllerWillPresentOpenInMenu(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ WillPresentOpenInMenu ] --------------------\n")
  }
  func documentInteractionControllerDidDismissOpenInMenu(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ DidDismissOpenInMenu ] --------------------\n")
  }

  // MARK: OptionsMenu
  
  func documentInteractionControllerWillPresentOptionsMenu(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ WillPresentOptionsMenu ] --------------------\n")
  }
  func documentInteractionControllerDidDismissOptionsMenu(_ controller: UIDocumentInteractionController) {
    print("\n-------------------- [ DidDismissOptionsMenu ] --------------------\n")
  }
}

