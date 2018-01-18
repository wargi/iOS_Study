# 2017.01.18

## 1. 반복문이란?
- 반복적으로 실행되는 코드를 만드는 구문
- 종류는 while문과 for문이 있다

## 2. while 문
: 조건이 참일 경우 구문이 반복 실행되며 무한루프에 빠지지 않게 설정을 잘 해주어야 한다.<br>

~~~
///선언 방법
//while 조건
//{
//    구문 실행
//}

// while문 사용 예제
var index = 0;
while index < 10  //10보다 index가 커지면 종료
{
print("현재 횟수는 \(index)입니다.") index += 1;
}
~~~

## 3. for-in 문
: 배열의 항목, 숫자의 범위 또는 문자열의 문자와 같은 시퀀스를 반복 하려면 for 반복문를 사용합니다.

~~~
//for-in문의 선언 방법 및 사용 예제
let numbers = [1,2,3,4,5]
for number in numbers
{
    print("\(number)") //1~5까지의 배열을 출력
}
~~~

## 4. 반복문 실습 과제
- [for-in문 실습 과제](https://github.com/wargi/SangWookPark_IOS_School6/blob/master/Practice/For/For/For.swift)

- [while문 실습 과제](https://github.com/wargi/SangWookPark_IOS_School6/blob/master/Practice/While/While/While.swift)