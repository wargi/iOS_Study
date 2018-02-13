# 2018.01.22
## 1. Class & Struct
- 프로그램 코드 블록의 기본 구조이다.
- 프로퍼티와 메서드를 추가 할수 있다. (두 구조의 문법 같음)
- 단일 파일에 정의 되며(필수는 아니다) 다른 코드에서 자동으로 사용 할수 있습 니다.(접근 제한자에 따라 접근성은 차이가 있다. internal 기본 접근 제한자)
- 인스턴스 생성 및 초기 상태를 설정하기 위해 initializer(초기화 메소드)를 사용 하고, 사용자의 니즈에 맞춰 Custom한 initializer를 만들어 사용할 수 있다.
- 둘 구조 모두 메모리에 적재되면 instance라고 불린다.
- 기본 블록에 추가하여 확장된 블록을 추가 할 수 있다. (Extensions)
- 프로토콜을 채택하여 사용할 수 있다.

## 2. 기본구조
~~~swift
//클래스 선언 및 내부 구조
class SomeClass {
// 클래스 내부에 구조체 객체 생성 가능하지만 구조체는 안됨
var SomeStructure = SomeStructure()

var interlaced = false
var frameRate = 0.0
var name: String?
}

//구조체 선언 및 내부 구조
class SomeStructure {
var width = 0
vvar height = 0
}

class temp {
//클래스 객체 생성
let someClassObject: SomeClass = SomeClass()
//프로퍼티 접근
print("someClassObject is \(someClassObject.resolution.width)”)

//구조체 객체 생성
let someStructObject: SomeStructure = SomeStructure()
print("VideoMode is \(someStructObject.resolution.width)”)
}
~~~

## 3. Class VS Struct
- Class는 참조 타입이며, Structure는 값 타입이다.
- Class는 상속을 통해 부모클래스의 특성을 상속받을수 있다.
- Class는 Type Casting을 사용할수 있다.(Structure 불가)
- Structure의 프로퍼티는 instance가 var를 통해서 만들어야 수정 가능하다.
- Class는 Reference Counting을 통해 인스턴스의 해제를 계산합니 
- Calss는 deinitializer를 사용할수 있습니다.
