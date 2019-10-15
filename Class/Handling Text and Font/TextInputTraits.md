# Text Input Traits

## 1. UILabel
- 하나 이상의 읽기 전용 텍스트 행을 표시하는 텍스트출력박스로 컨트롤러와 함께 사용되는 경우가 많다.

## 2. UILabel Class
~~~swift
//레이블에 표시 될 텍스트 입력
open var text: String?
    
//텍스트 폰트 지정
open var font: UIFont!
    
//텍스트 컬러 지정
open var textColor: UIColor!
    
//글자의 그림자 색깔을 설정
open var shadowColor: UIColor?

//그림자의 위치 등을 설정 가능한 옵션
open var shadowOffset: CGSize
    
//레이블의 글자 위치
open var textAlignment: NSTextAlignment
    
//레이블의 경계 선이 너무 길 때 어떤식으로 줄 바꿈 할지 설정
open var lineBreakMode: NSLineBreakMode   
    
//isHighlighted가 true일때 하이라이트 설정한 글자색 변경
open var highlightedTextColor: UIColor?
    
//레이블의 텍스트를 하이라이트 설정을 할 수 있다.
open var isHighlighted: Bool // default is NO

//false시에 사용자 이벤트가 무시되고 대기열에서 제거
open var isUserInteractionEnabled: Bool // default is NO
    
//isEnabled이 false일시 글자 비활성화
open var isEnabled: Bool // default is YES. changes how the label is drawn    

//레이블의 줄 수
//(0으로 할 시 정하지 않고 필요한 만큼 줄을 사용)    
open var numberOfLines: Int

//레이블이 작아서 글꼴을 다 표시하지 못 할 때
//자동으로 글꼴의 크기를 줄여서 표시해주는 기능
open var adjustsFontSizeToFitWidth: Bool // default is NO
~~~

## 3. UILabel 예제
<img src="ex1.png" width="30%">

~~~swift
//레이블예제
//레이블 생성
var myCustumLB : UILabel!
    
override func Create() {

	//레이블 초기화 및 레이블 프레임 설정
	myCustumLB = UILabel(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 100))
	
	//레이블 텍스트 입력
        myCustumLB.text =
                        """
                        안녕하세요
                        제 이름은
                        박상욱입니다.
                        """
	
	//텍스트 위치 설정
	myCustumLB.textAlignment = .center
	
	//텍스트 폰트 설정
	myCustumLB.font = UIFont.systemFont(ofSize: 20)
	
	//하이라이트 설정
	myCustumLB.isHighlighted = true
	
	//라인수 제한 없음
	myCustumLB.numberOfLines = 0
	
	//그림자 색상 설정
	myCustumLB.shadowColor = UIColor.brown
	
	//라인 개행 설정
	myCustumLB.lineBreakMode = .byCharWrapping
	
	//그림자 위치 설정
	myCustumLB.shadowOffset = CGSize(width: 5, height: 5)
	
	//레이블의 백그라운드 컬러 설정
	myCustumLB.backgroundColor = .black
	
	//레이블의 텍스트 컬러 설정
	myCustumLB.textColor = .white
~~~