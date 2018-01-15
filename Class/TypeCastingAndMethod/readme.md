# 2017.01.15 #

## 형변환 / 함수사용 ##

### 1. 형변환 ###

### 2. 여러가지 함수의 사용법 ###
---
- Argument Name and Parameter Names<br>
> 인수명은 함수 호출시 사용 되는 이름. (Argument-아규먼트)<br>
> 매개변수는 함수 내부에서 사용 되는 변수명.(Parameter-파라메터)<br>
> 인수명은 생략가능하며, 생략하면 매개변수명이 인수명로 사용된다.<br>
> 인수명을 제거하고 싶으면 와일드카드 ( _ )를 사용한다.<br>

~~~
// 예시 
// 일반적 선언
func methodName(argumentName parameterName : Any) -> Any
{
    // 함수내용
}
  
//아규먼트 생략 선언(파라미터가 인수명으로 사용)
func methodName(parameterName : Any) -> Any
{
    // 함수내용
}
  
// 와일드카드 사용 (인수명 제거)
func methodName(_ parameterName : Any) -> Any
{
    // 함수내용
}

// 함수 호출 : 함수이름(아규먼트 : 값) - 밖에선 인수명으로 사용 
methodName(argumentName: 10)
~~~

- Default Parameter Values<br>
> 매개변수(파라미터) 기본값을 설정할 수 있다.<br>
> 매개변수(파라미터) 값이 들어오지 않을때 기본값이 사용된다.<br>

> ~~~
> // 예시
> // Default Parameter 값이 들어간 함수 선언
> // number함수는 인자값(num1, num2)을 받아 더한 후 결과값을 리턴해주는 함수
> // num2의 인자값(아규먼트)이 없을 시에 num2에 10의 값을 대입
> func number(num1: Int, num2: Int = 10) -> Int
> {
>     return num1 + num2
> }
>  
> number(num1: 10)
> // num1 : 10, num2 : 10(defaultValue), 리턴값 : 20
> 
> 
> number(num1: 10, num2: 5)
> // num1 : 10, num2 : 5, 리턴값 : 15
> 
> ~~~

- In-Out Parameter Keyword<br>
> 파라미터는 상수값이다 왜냐하면 함수에서 이루어지는 행위는 가져온 인자값에 영향을 끼치지 않는다.<br>
> 파라미터로 받아오는 인자 값을 변경해야 한다면 inout 키워드를 사용하여 
inout매개변수로 지정 해야 한다.<br>
> inout매개변수 지정은 타입 앞에 inout keyword를 작성해준다.<br>
> inout 변수가 지정된 함수의 넘겨주는 아규먼트값 앞에서 &(주소정보)를 붙어야 한다.

>~~~
>// 예시
>// 받아오는 인자들의 값을 서로 바꾸어주는 함수이다.
>// 교환을 위한 임시 저장 장소 : temporaryA
>// 와일드카드로 받아오는 두개의 인자명을 생략하였다
>// 인아웃 선언 방법 a : inout
>func swapTwoInts(_ a: inout Int, _ b: inout Int)
>{>    let temporaryA = a>    a=b>    b = temporaryA>}
>
>var someInt = 3>var anotherInt = 107>swapTwoInts(&someInt, &anotherInt) // 넘겨주는 인자명앞에 &
>
>/*
>swapTwoInts(3, 107) 
>swapTwoInts(&3, &107)
>데이터를 변수에 저장하고 그 변수의 주소값을 보내주어야 하기에
>위 예제처럼 정수, 문자 등과 같이 '값'만 전달 해줄 수 없다
>*/
> ~~~