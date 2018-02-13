# 2018.01.26
## 1. Properties 란?
- 변수의 다른 이름
- 클래스, 구조체, 열거형에서 전체의 속성으로 사용되는 변수를 프로퍼티라고 부른다.

## 2. Properties의 종류
- 저장 프로퍼티 (Stored Properties)
- 연산 프로퍼티 (Computed Properties)
- 타입 프로퍼티 (TypeProperties)

## 3. 저장 프로퍼티 (Stored Properties)
### 3-1. 일반적인 저장 프로퍼티(Stored Properties)
- 간단한 형식으로 저장 속성은 상수나 변수이며 특정 클래스나 구조체의 인스턴스의 부분으로서 저장됨. var 키워드가 붙으면 변수 저장 속성, let 키워드가 붙으면 상수 저장 속성임.
- 저장 프로퍼티에는 추가적으로 Lazy Stored Properties가 있다.

~~~swift
struct Subject {
	//저장 프로퍼티
	var name:String
	var score:Int
}
class Person {
	//저장 프로퍼티	var name:String	var gender:String
	var blood:String? }
~~~

### 3-1. 지연저장 프로퍼티(Lazy Stored Properties)
- 지연 저장된 속성은 처음 프로퍼티가 사용되기 전 까지 초기값이 계산되지 않은 특성을 가지고 있는 프로퍼티이다.
- 지연 저장 속성은 lazy keyword를 선언 앞에 작성한다.
- let은 지연 저장 프로퍼티로 설정할 수 없다.
- 초기화하는데 오래걸리거나, 복잡한 초기화 과정이 있는 변수의 경우 지연저장을 사용하면 좋다.

~~~swift
class ViewController: UIViewController {	//지연 저장 프로퍼티	//init 시점이 아닌 사용이 되는 시점에 초기화 한다.	lazy var cal:Calculator = Calculator()	override func viewDidLoad() {		super.viewDidLoad()
		
		cal.average(student: Student())
	}
}
~~~

## 4. 연산 프로퍼티 (Computed Properties)
### 4-1. 일반 연산프로퍼티(Computed Properties)
- 실제로 값을 저장하지 않지만, get, set키워드를 통해서 값을 간접적으로 설정하거나 받을 수 있다.
- 일반적으로 메소드중 속성에 관련된 메소드를 연산프로퍼티로 사용한다.
- 클래스, 구조체, 열거형 모두에서 사용 가능하다.

~~~swift
struct Point {
	var x = 0.0, y = 0.0
}
struct Size {
	var width = 0.0, height = 0.0
}
struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let centerX = origin.x + (size.width / 2)
			let centerY = origin.y + (size.height / 2)
			return Point(x: centerX, y: centerY)
		}
		set(newCenter) {
			origin.x = newCenter.x - (size.width / 2)
			origin.y = newCenter.y - (size.height / 2)
		}
		//set의 값을 미지정시에 newValue가 기본 값으로 사용.
		//set() {
		//	origin.x = newValue.x - (size.width / 2)
		//	origin.y = newValue.y - (size.height / 2)
		//}
	}
	//읽기 전용 연산프로퍼티 작성시 get 키워드 없이 바로 작성 가능
	//쓰기 전용 연산 프로퍼티는 작성 불가
	struct Cuboid {
          var width = 0.0, height = 0.0, depth = 0.0
          var volume: Double {
              return width * height * depth
          }
	}
}
~~~

### 4-2 Property Observers
- 프로퍼티 값의 변화를 감시하고 그에 따라 대응한다.
- 초기값이 설정된 저장 프로퍼티에서 사용 가능하다. .
- 프로퍼티의 값이 설정될때마다 호출된다.
- didSet, willSet 키워드를 통해 값 변화의 직전 직후를 감지 할수 있다.
- 값이름 미지정시 oldValue, newValue가 기본값으로 지정된다.

~~~swift
var changeValue:Int = 0
{
	didSet(oldV){
		print("oldValue \(oldV)")
	}
	willSet(willV)
	{
		print("newValue \(willV)")
	}
}
	changeValue = 4
~~~

## 5. 타입 프로퍼티 (TypeProperties)
- 인스턴스의 속성이 아닌, 타입에 따른 속성을 정의 할수 있다.
- static 키워드를 사용해서 타입 프로퍼티를 설정할수 있으며, 클 래스의 경우 연산 프로퍼티의 오버라이드를 지원하기 위해서는 class 키워드를 사용해서 클래스 타입에서 연산 프로퍼티를 설정 해야 한다.(class키워드는 저장 프로퍼티는 사용불가)
- 값을 가져올때는 클래스의 이름을 통해서 가져올 수 있다.

~~~swift
//타입 프로퍼티 예제
struct AudioChannel {	static let level = 10	static var maxLevel = 0	var currentLevel: Int = 0 {		didSet {
			//AudioChannel Class의 level 직접호출			if currentLevel > AudioChannel.level
			{
				currentLevel = AudioChannel.level
			}
			//AudioChannel Class의 maxLevel 직접호출			if currentLevel > AudioChannel.maxLevel			{
				AudioChannel.maxLevel = currentLevel			}
		}
	}
}
~~~