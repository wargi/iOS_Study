# 2018.01.26

## 1. 접근 제어자란?
- 외부 모듈에서의 접근을 제어하는 수단
- 캡슐화, 은닉화를 위해 사용

## 2. 모듈과 소스파일이란?
- 모듈 : 배포할 코드의 묶음 단위, 통상 프레임워크나 라이브러리, 어플리케이션이 모듈의 단위가 될수 있다.
- 소스파일 : 하나의 스위프트 소스코드 파일

## 3. 접근제어자의 종류?
- Open (개방 접근수준) : 모듈 외부까지 접근 가능
- public (공개 접근수준) : 모듈 외부까지 접근 가능
- internal (내부 접근수준) : 모듈 내부에서 접근가능, 기본 지정값
- ileprivate (파일외 비공개) : 파일 내부에서만 접근가능
- private (비공개) : 기능 정의 내부에서만 가능

## 4. 접근제어자의 예시
```swift
//자식클래스는 부모클래스의 접근제어자보다 더 공개범위가 넓은 접근제어자를 사용 할 수 없다.
//마찬가지로 클래스내부의 프로퍼티와 메서드 등 클래스의 접근제어자 보다 더 공개범위가 넓은 접근제어자를 사용 할 수 없다.

//클래스의 접근제어는 public
public class SomePublicClass
{
    public var somePublicProperty = 0 //외부에서도 사용 가능
    var someInternalProperty = 0 //(기본값 : internal)내부의 다른파일에서도 사용 가능
    fileprivate func someFilePrivateMethod() {} //같은 파일내부에서만 사용 가능
    private func somePrivateMethod() {} //같은 클래스에서만 사용 가능
}

//클래스의 접근제어자는 internal
class SomeInternalClass
{
    var someInternalProperty = 0 //기본값 : internal
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

//클래스의 접근제어자는 fileprivate
fileprivate class SomeFilePrivateClass
{
    func someFilePrivateMethod() {} //클래스가 fileprivate이므로 접근제어자를 생략할 시에 접근제어자는 fileprivate
    private func somePrivateMethod() {}
}

//클래스의 접근제어자는 private
private class SomePrivateClass
{
    func somePrivateMethod() {} //클래스가 private이므로 접근제어자를 생략할 시에 접근제어자는 private

}
```