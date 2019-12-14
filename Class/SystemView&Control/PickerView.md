# Picker View

## 1. Picker View 란 ?
- *PickerView*는 여러 문자열 중에 하나를 선택하는 컴포넌트 객체입니다.

## 2. 사용
~~~swift
import UIKit

class TextPickerViewController: UIViewController {
   // PickerView
   @IBOutlet private weak var pickerView : UIPickerView!
   // 더미 데이터
   let devTools = ["Xcode", "Postman", "SourceTree", "Zeplin", "Android Studio", "SublimeText"]
   let fruits = ["Apple", "Orange", "Banana", "Kiwi", "Watermelon", "Peach", "Strawberry"]
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
}

// PickerView는 스토리보드만으로만 설정 할 수 없다.
// 델리게이트와 데이타소스를 연결 해주어야 한다.
extension TextPickerViewController: UIPickerViewDataSource {
   // 컴포넌트 내부의 Row 개수 (필수구현)
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return devTools.count
   }
   // 표시할 컴포넌트 수
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
   }
}

extension TextPickerViewController: UIPickerViewDelegate {
   // 컴포넌트 내부의 Row의 title 설정
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return devTools[row]
   }
}
~~~
