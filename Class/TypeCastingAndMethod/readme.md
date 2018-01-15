# 2017.01.15 #

## 형변환 / 함수사용 ##

### 1. 형변환 ###

### 2. 여러가지 함수의 사용법 ###

#### 1) Argument Name and Parameter Names ####
- 인수명은 함수 호출시 사용 되는 이름. (Argument-아규먼트)<br>
- 매개변수는 함수 내부에서 사용 되는 변수명.(Parameter-파라메터)<br>
- 인수명은 생략가능하며, 생략하면 매개변수명이 인수명로 사용된다.<br>
- 인수명을 제거하고 싶으면 와일드카드 ( _ )를 사용한다.<br>

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

#### 2) Default Parameter Values ####
- 매개변수(파라미터) 기본값을 설정할 수 있다.<br>
- 매개변수(파라미터) 값이 들어오지 않을때 기본값이 사용된다.<br>

~~~
// 예시
// Default Parameter 값이 들어간 함수 선언
// number함수는 인자값(num1, num2)을 받아 더한 후 결과값을 리턴해주는 함수
// num2의 인자값(아규먼트)이 없을 시에 num2에 10의 값을 대입
func number(num1: Int, num2: Int = 10) -> Int
{
    return num1 + num2
}
 
number(num1: 10)
// num1 : 10, num2 : 10(defaultValue), 리턴값 : 20

number(num1: 10, num2: 5)
// num1 : 10, num2 : 5, 리턴값 : 15

~~~

#### 3) In-Out Parameter Keyword ####
- 파라미터는 상수값이다 왜냐하면 함수에서 이루어지는 행위는 가져온 인자값에 영향을 끼치지 않는다.<br>
- 파라미터로 받아오는 인자 값을 변경해야 한다면 inout 키워드를 사용하여 
inout매개변수로 지정 해야 한다.<br>
- inout매개변수 지정은 타입 앞에 inout keyword를 작성해준다.<br>
- inout 변수가 지정된 함수의 넘겨주는 아규먼트값 앞에서 &(주소정보)를 붙어야 한다.

~~~
// 예시
// 받아오는 인자들의 값을 서로 바꾸어주는 함수이다.
// 교환을 위한 임시 저장 장소 : temporaryA
// 와일드카드로 받아오는 두개의 인자명을 생략하였다
// 인아웃 선언 방법 a : inout
func swapTwoInts(_ a: inout Int, _ b: inout Int)
{    let temporaryA = a    a=b    b = temporaryA}

var someInt = 3var anotherInt = 107swapTwoInts(&someInt, &anotherInt) // 넘겨주는 인자명앞에 &

/*
swapTwoInts(3, 107) 
swapTwoInts(&3, &107)
데이터를 변수에 저장하고 그 변수의 주소값을 보내주어야 하기에
위 예제처럼 정수, 문자 등과 같이 '값'만 전달 해줄 수 없다
*/
~~~

### 3. 함수 반환과 여러가지 함수 및 예제 ###
#### 1) 함수 반환 ####
- 함수 실행 결과의 리턴 타입을 명시 해준다
- return 키워드를 사용하여 함수 결과 반환
- 반환 타입과 같은 타입의 데이터를 반환 해야 한다
- 한개의 값만 반환 할수 있다.

~~~
// 정수형 값을 반환 해주는 함수
func fName(agumentName paramName:Int) -> Int
{
    return paramName + 3
}

// 반환 값이 없는 경우의 함수
// 반환값이 없는 경우는 Retrun Type을 작성하지 않고( -> 제거) 
// retrun 키워드를 사용할 필요가 없다.(반환값이 없기때문)
func fName(agumentName paramName:Int) -> Int
{
    // 함수내용
}
~~~

#### 2) 여러가지 함수 예제 ####

~~~
// 가져온 정수를 리턴 해주는 함수
func pass(num:Int) -> Int
{
    return num
}

// 파이를 선언하고 파이의 값을 넣어 준 후 파이값을 리턴해주는 함수
func getPI() -> Double
{
    let pi: Double = 3.141592
    return pi
}

// 두개의 정수 값을 받아와서 더한 결과 값을 리턴해주는 함수 
func sum(firstNum num1:Int, secondNum num2:Int) -> Int {
    return num1 +num2
}

// 두개의 정수 값을 받아와서 더한 결과 값을 리턴해주는 함수
// 두번째 인자(num2)의 값이 없을시 num2의 기본값 5를 적용해서 연산 후 리턴
func sum(num1:Int, num2:Int = 5) -> Int {
    return num1 + num2
}

// 가져온 정수를 리턴 해주는 함수
// 와일드카드를 사용하여 아규먼트네임 생략
func passNum(_ num:Int) -> Int
{
    return num
}

// inout키워드를 사용하여 두개의 아규먼트의 주소 값을 받아와서 서로가 가진 주소값을 교환하여 준다
// 실질적으로 주소안에든 서로의 값이 변경 됨을 확인 할 수 있다func swapTwoInts(lInt a: inout Int, rInt b: inout Int) {    let temporaryA: Int = a    a=b    b = temporaryA}

// 두개의 인자를 받아와서 매개변수끼리 덧셈과 뺄셈을 수행 후에 연산의 결과
// plus와 minus를 튜플에 리턴해준다func calculator(num1:Int, num2:Int) -> (Int, Int)
{    let plus = num1 + num2    let minus = num1 - num2    return (plus, minus)}

// "my name is youngmin"의 문자열을 리턴
func printName() -> String
{
   return “my name is youngmin”
}

// print함수 실행
func printName()
{
   print(“my name is youngmin”)
}

// name의 값이 지정 되지 않을 시 "my name is youngmin" 출력
// name의 파라미터 값이 있을때 파라미터 값의 문자열을 출력
func printName(name:String = “youngmin”)
{
   print(“my name is \(name)”)
}

// explain의 인자 값에 joo라는 문자를 추가
// 예시) explain의 값이 "youngmin"일때 함수 실행후에는
// explain에는 "youngminjoo"가 들어가게 된다
func printName(explain str: inout String) -> String
{
   str += “joo”
   return str
}
~~~

### 3. 함수관련 실습 과제 ###
~~~
import Foundation

class ToolBoxClass
{
    //inch To cm
    func inchToCm(inch : Double) -> Double {
        return inch * 2.54
    }
    
    //cm To inch
    func cmToInch(cm : Double) -> Double {
        return cm / 2.54
    }
    
    //M2 To Spacious
    func m2ToSpacious(m2 : Double) -> Double {
        return m2 * 0.3025
    }
    
    //Spacious To M2
    func spaciousToM2(spacious : Int) -> Double {
        return Double(spacious) / 3.3058
    }
    
    //F To C
    func fToC(f : Double) -> Double
    {
        return (f-32) / 1.8
    }
    
    //C To F
    func cToF(c : Double) -> Double {
        return c * 1.8 + 32
    }
    
    //KB To MB Or MB To GB
    func byteChange(byte : Int) -> Int {
        return Int(Double(byte) / 1024)
    }
    
    //시간(HHMMSS)을 받으면 초단위로 변경 ex) 11320 >> 4400초
    func secondChange(timeTemp : Int) -> Int {
        let hour : Int = timeTemp / 10000
        let min : Int = (timeTemp - (hour * 10000)) / 100
        let sec : Int = timeTemp % 100
        
        return hour * 3600 + min * 60 + sec
    }
    
    //MARK: 기초
    //1-a 이름(문자열)을 받아서 이름을 출력하는 함수
    func namePrint(name : String)
    {
        print("나의 이름은 \(name)입니다")
    }
    
    //1-b 나이*(정수)를 받아서 나이를 출력하는 함수
    func agePrint(age : Int)
    {
        print("나의 나이는 \(age)입니다")
    }
    
    //1-c.이름과 주소를 입력받아 자기소개글을 프린트 하는 함수
    func introducePrint(name : String, address : String)
    {
        namePrint(name: name)
        print("나의 주소는 \(address)입니다")
        print("반갑습니다 !!")
    }
    
    //정수를 하나 입력받아서 2로 나눈 값을 반환해주는 함수
    func intToDivision(number : Int) -> Double
    {
        return Double(number) / 2
    }
    
    //정수를 하나 입력받아서 제곱을 반환해주는 함수
    func intToSquare(number : Int) -> Int
    {
        return number * number
    }
    
    //MARK: 응용 - 다중 입력, 반환
    //2-a. 두개의 정수를 입력받아 두수의 합을 반환해주는 함수
    func intToSub(number1 : Int, number2 : Int) -> Int
    {
        return number1 - number2
    }
    
    //2-b. 두개의 정수를 입력받아 두수의 차를 반환해주는 함수
    func intToAdd(number1 : Int, number2 : Int) -> Int
    {
        return number1 + number2
    }
    
    //2-c. 두개의 정수를 입력받아 두수의 곱을 반환해주는 함수
    func intToMuk(number1 : Int, number2 : Int) -> Int
    {
        return number1 * number2
    }
    
    //2-d. 두개의 정수를 입력받아 두수의 나누셈을 반환해주는 함수
    func intToDivision(number1 : Int, number2 : Int) -> Int
    {
        return number1 / number2
    }
    
    //MARK: 응용
    //부모님과 내 나이를 입력 후 그 나이차를 프린드 하는 함수
    func parentWithMySub(parentAge : Int, myAge : Int)
    {
        print("어머니의 나이는 \(parentAge)세이고 내 나이는 \(myAge)살이므로 우리의 나이차이는 \(parentAge - myAge)살 입니다.")
    }
    
    //시험점수 여러개를 입력받아서(4개이상) 평균을 반환해주는 함수
    func parentWithMySub(sub1 : Int, sub2 : Int, sub3 : Int, sub4 : Int, sub5 : Int) -> Double
    {
        let sum : Int = sub1 + sub2 + sub3 + sub4 + sub5
        return Double(sum) / 5
    }
    
    //MARK: 캐스팅관련 부분
    //정수를 하나 입력받아서 실수로 변환 후 반환해주는 함수
    func intToDouble(number : Int) -> Double
    {
        return Double(number)
    }
    
    //정수를 두개를 입력받아 두수를 합친수를 출력하는 함수 (ex: 3,4 입력시 >>> 34 /// 1,0 입력시 >>> 10)
    func twoOfNumberAddToString(number1 : Int, number2 : Int) -> String
    {
        return String(number1) + String(number2)
    }
    
    //실수를 하나 입력받아서 소수점 첫번재 자리에서 반올림 후 정수를 반환해주는 함수
    func doubleToOneOfPointToRound(number : Double) -> Int
    {
        return Int(round(number))
    }
}
~~~