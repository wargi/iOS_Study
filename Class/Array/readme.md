# 2018.01.19

## 1. Collection Type
- Swift는 값의 모음을 저장하기위한 배열, 집합 및 사전이라는 세 가지 기본 형식을 제공 합니다.
- 배열(Array)은 정렬 된 값 모음입니다. 
- 집합(Set)은 고유 한 값의 정렬되지 않은 모음입니다. 
- 사전(Dictionary)은 키 - 값 연관의 정렬되지 않은 모음입니다.

## 2. Array
- 배열(영어: array)은 번호(인덱스)와 번호에 대응하는 데이터들로 이루어진 자료 구조를 나타낸다.
- 일반적으로 배열에는 같은 종류의 데이터들이 순차적으로 저장되어, 값의 번호가 곧 배열의 시작점으로부터 값이 저장되어 있는 상대적인 위치가 된다.

~~~
//배열의 선언 및 리터럴
var list :[String] = ["배열","선언"]

//list[0] -> "배열"
//list의 0번째에 "배열"이 저장되는 것처럼
//배열을 선언하면 0번 번호부터 순서대로 String의 데이터가 저장된다

//배열의 기능
//배열의 Element 갯수
list.count //값 : 2

//빈 배열 확인
list.isEmpty //값 : false

//Element 추가
list.append("입니다") //값 : ["배열","선언","입니다"]

//Element 삽입
list.insert("의", at: 1) //값 : ["배열","의","선언","입니다"]

//Element 삭제
list.remove(at: 1) //값 : ["배열","선언","입니다"]
~~~

## 3. Set
- Set은 같은 타입의 데이터가 순서없이 모여있는 자료구조, 각 항목의 순서가 중요치 않아서 삽입의 기능이 따로 없으며 한번만 표시해야하는 경우 배열 대신 사용된다.

~~~
//Set의 선언 및 리터럴
var someInts:Set<Int> = [1,2,3,4]

//Set의 기능
//Set의 Element 갯수
someInts.count //값 : 4

//빈 Set 확인
someInts.isEmpty //값 : false

//Element 추가
someInts.insert(5) //값 : [1,2,3,4,5]

//Element 삭제
list.remove(3) //값 : [1,2,4,5]

//Set의 추가 기능 예제
func setTest()



let intersectList = oddDigits.intersection(evenDigits)
let differenceList = oddDigits.symmetricDifference(primeDigits)

//정렬을 하고 unionList에 값을 넣어주므로 unionList는 배열로 저장된다
let unionList = oddDigits.union(evenDigits).sorted()

let subtractList = oddDigits.subtracting(primeDigits).sorted()

~~~

## 4. Dictionary
- Dictionary는 순서가 정해져 있지 않은 데이터에 키값을 통해 구 분할수 있는 자료구조. 항목의 순서가 중요치 않고 key값을 통해 서 데이터를 접근할때 사용합니다.

~~~

dic.updateValue("Seoul", forKey: "address")
//결과 : ["name":"joo", "age":20, "job":"Developer", "isSingle":true, "address" : "seoul]
//결과 : ["name":"winman", "age":20, "job":"Developer", "isSingle":true, "address" : "seoul]

//결과 : ["name":"winman", "age":20, "job":"Developer",  "address" : "seoul]

//결과 : 제 이름은 winman입니다.
 
~~~

## 5. 실습 및 과제
- [Collection Type 실습과제 확인 하기](https://github.com/wargi/SangWookPark_IOS_School6/blob/master/Practice/ArrayF/ArrayF/ArrayF.swift)