# 2018.02.01

## 1. UIControl
- UIComponent에 사용자 인터렉션에 의한 응답에 대해 특별한 액션을 줄수 있게 설정하는 클래스

## 2. UIControl Class
~~~swift
//기본상태
public static var normal: UIControlState { get }

//누르고 있는 상태
public static var highlighted: UIControlState { get }

//이벤트 비활성화
open var isEnabled: Bool

//선택된 상태
open var isSelected: Bool

//controlEvents가 발생되었을때 target에 있는 action 실행
open func addTarget(_ target: Any?,
                       action: Selector,
            for controlEvents: UIControlEvents)
~~~

## 3. UIButton
- 사용자의 이벤트를 받아 처리해주는 UI

## 4. UIButton 구조
<img src="ex1.png" width="100%">
- 버튼 구조 : Title, Image, backgroundImage

## 5. 실습
normal -> <img src="ex2.png" width="31.5%"> selected ->  <img src="ex3.png" width="30%"><br>


~~~swift
// myCustumBtn 버튼 생성
var myCustumBtn : UIButton!

func create() {
	//myCustumBtn 초기화 및 프레임 설정
	myCustumBtn = UIButton(frame: 
	CGRect(x: 100, y: 100, width: 200, height: 200))
	
	//myCustumBtn의 normal 상태의 글자 입력
	myCustumBtn.setTitle("버튼입니다", for: .normal)
	
	//myCustumBtn의 normal 상태의 글자색 지정
	myCustumBtn.setTitleColor(.red, for: .normal)
	
	//myCustumBtn의 normal 상태의 버튼의 배경 지정
	myCustumBtn.setBackgroundImage(
		UIImage(named:"Logo.jpeg"), 
		for: UIControlState.normal)
		
	//myCustumBtn의 selected 상태의 글자 입력
	myCustumBtn.setTitle("누른상태입니다.", for: .selected)
	
	//myCustumBtn의 selected 상태의 글자색 지정
	myCustumBtn.setTitleColor(.black, for: .selected)
	
	//myCustumBtn의 글자 폰트 지정
	myCustumBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
	
	//myCustumBtn의 배경색 지정
	myCustumBtn.backgroundColor = .black
	
	//touchUpInside 이벤트 발생시 self의 self.clickEvent실행
	myCustumBtn.addTarget(self, action:
		#selector(self.clickEvent(_:)),
		 for: .touchUpInside)
		 
	//myCustumBtn의 isEnabled속성 true
	myCustumBtn.isEnabled = true
	
	//root뷰위에 myCustumBtn을 addSubview
	self.view.addSubview(myCustumBtn)
    }

//touchUpInside 이벤트 발생 시 버튼의 isSelected 상태를 바꿔준다
@objc func clickEvent(_ sender : UIButton) {
	if sender.isSelected {
		sender.isSelected = false
	} else {
		sender.isSelected = true
	}
}
~~~