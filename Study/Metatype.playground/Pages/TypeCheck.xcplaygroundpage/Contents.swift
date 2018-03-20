//: # Type Check
import Foundation

print("\n---------- [ Print Type ] ----------\n")

private func printType<T>(of type: T.Type) {
  print("\(type)")
}
printType(of: type(of: Int.self))
printType(of: Int.self)
printType(of: type(of: 10))



print("\n---------- [ Print Instance ] ----------\n")

private func printInstance<T>(of instance: T) {
  print("\(instance)")
}
printInstance(of: Int.self)
printInstance(of: 10)

print("\n---------- [ Instance Type Check ] ----------\n")

let str = "StringInstance"
print(str is String)           // true, str 은 String Type 의 객체
print(str == "StringInstance") // true, str 은 "StringInstance" 와 동일
print(str is String.Type)      // false
print(type(of: str) is String.Type.Type) // false



print("\n---------- [ Type's Type check ] ----------\n")

print(type(of: str) is String)       // false
print(type(of: str) == String.self)  // true, str 객체의 타입은 String 그 자체
print(type(of: str) is String.Type)  // true, str 객체의 타입은 String.Type 의 객체



print("\n---------- [ Metatype's Type check ] ----------\n")

private let meta = type(of: String.self)
print(meta is String)  // false
print(meta == String.self)  // false
print(meta == String.Type.self)  // true, String 메타타입은 String.Type
print(meta is String.Type.Type)  // true, String 메타타입은 String.Type.Type 의 객체


//: [Next](@next)
