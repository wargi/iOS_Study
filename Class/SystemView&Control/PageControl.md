# Page Control

## 1. PageControl 이란?
- 페이지 컨트롤은 수평으로 페이징되는 UI에서 전체 페이지수와 현재페이지를 표시하는 UI

## 2. 구현
~~~swift
@IBOutlet weak var inputField: UITextField!

// TextField의 borderStyle 변경
// 0: none (외각선 없음)
// 1: Line (외각선 있음)
// 2: Bezel (외각선이 있으며 내부선에 그림자 져보이는 느낌으로 생긴다)
// 3: Rounded Rect (모서리가 둥근 외각선 생성)
let style = let style = UITextBorderStyle(rawValue: 0)
inputField.borderStyle = style

// 텍스트 필드 입력 비활성화
inputField.isEnabled = false

// OverlayView
// : 오버레이뷰란 텍스트필드 박스 내부에 표시되는 작은 버튼으로 텍스트 입력에 선택을 주거나
// : 적은글을 지우는 등 다양하게 쓰일 수 있다.
// : Clear버튼은 스토리보드에서 선택을 통해 자동적으로 만들 수 있다.

// 텍스트 필드 Overlay View 만들기
let btn = UIButton(type: .custom)
btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
btn.setImage(UIImage(named: "menu"), for: .normal)
btn.addTarget(self, action: #selector(showPredefinedValue), for: .touchUpInside)
      
inputField.leftView = btn
inputField.leftViewMode = .always
~~~
