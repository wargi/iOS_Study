//: [Previous](@previous)
//: # Usage

class A {
    //상속받을 필요가 없을 때는 static을 쓰는 게 좋다.
  static func staticMethod() { print("Type Method(static func)") }
  class func classMethod() { print("Type Method(class func)") }
  func instanceMethod() { print("instance") }
  func instanceMethodWithNumber(_ number: Int) { print("Number :", number) }
}

//스택으로 선언을 해도 동적으로 사용할 수 있는 것을 보여주는 ㅇㅖ
let aInstance = A()
type(of: aInstance).classMethod()
type(of: aInstance).instanceMethodWithNumber(aInstance)(5)

A.staticMethod()
A.classMethod()
A.instanceMethod(aInstance)()

let aSelf = A.self
aSelf.staticMethod()
aSelf.classMethod()
aSelf.instanceMethod(aInstance)()
aSelf.instanceMethodWithNumber(aInstance)(3)


print("\n---------- [ Custom Type ] ----------\n")

// 일반적으로 typealias 사용
// typealias log = HandyLog
typealias MyString = String
let str = MyString("MyString Value")
print(str)

// 다음 방식으로도 활용 가능. 단 제약사항 존재
let IntArrayType = Array<Int>.self   // IntArrayType: Array<Int>.Type
// initializing from a metatype value must reference 'init' explicitly
let arr = IntArrayType.init(repeating: 5, count: 3)
print(arr)


/***************************************************
 그 외 실제 사용 예제
 ==============
 1. JSONDecoder decode
 open class JSONDecoder {
   func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
 }
 e.g. try JSONDecoder().decode(MyClass.self, from: data)
 
 2. UITableView Dynamic Cell Register
 tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
 
 3. UITableViewCell identifier extension
 extension UITableViewCell: TableViewCellType {
   static var identifier: String { return String(describing: self.self) }
 }
 e.g. CustomCell.identifier  -> "CustomCell"
 
 4. Storyboard instantiate extension
 extension UIStoryboard {
   func instantiateViewController<T>(ofType type: T.Type) -> T {
     return instantiateViewController(withIdentifier: String(describing: type)) as! T
   }
 }
 ***************************************************/

//: [Next](@next)
