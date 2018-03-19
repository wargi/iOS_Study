//: # Basic
//: **Metatype > Type > Instance**
print("\n---------- [ String Type itself] ----------\n")

/***************************************************
 String.Type > String > String
 
 let str = "String"
 str : struct String 의 객체
 String : struct String 자체에 대한 참조, String 메타타입(String.Type) 의 객체.  String.self 로 접근
 String.Type : String 의 메타타입
 ***************************************************/

//let _ = Swift.NSString.init("initString")  // Error
let swiftString = Swift.String.init("initString")
let swiftStringSelf = Swift.String.self
let swiftStringType = type(of: swiftString)
let swiftStringMetatype = type(of: Swift.String.self)
let swiftStringMetatypeSelf = swiftStringMetatype.self
let swiftStringMetatypeType = type(of: swiftStringMetatype)
print(swiftString)
print(swiftStringSelf)
print(swiftStringType)
print(swiftStringMetatype)
print(swiftStringMetatypeSelf)
print(swiftStringMetatypeType)

print("\n---------- [ String Types ] ----------\n")

let str: String = "myString"
let stringSelf: String = "myString".self
let stringType: String.Type  = type(of: "myString")
let stringMetatype: String.Type.Type  = type(of: type(of: "myString"))
print(str)
print(stringSelf)
print(stringType)
print(stringMetatype)

print("\n---------- [ Protocol Types ] ----------\n")

struct S {}
class C {}
enum E {}
protocol P {}
print(type(of: S.self))
print(type(of: C.self))
print(type(of: E.self))
print(type(of: P.self))

//: [Next](@next)
