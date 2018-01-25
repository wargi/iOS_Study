//
//  ArrayF.swift
//  ArrayF
//
//  Created by 박상욱 on 2018. 1. 19..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class ArrayF
{
    //배열의 선언 및 기능 테스트
    func arrayTest1()
    {
        
        var list:[String] = ["My","name","is","a","park","sangwook"]
        list.append("입니다")
        print("list배열의 총 갯수는", list.count)
        print(list[3])
        list.remove(at: 3)
        list.insert("My introduce it my self", at: 0)
        
        for text in list
        {
            print(text)
        }
    }
    
    //배열의 선언 및 기능 테스트2
    func arrayTest2()
    {
        var intArray : [Int] = [1,2,3,4]
        
        print("\(intArray.count)")
        print("\(intArray.isEmpty)")
        
        intArray.append(6)
        print("\(intArray)")
        
        intArray.insert(5, at: 4)
        print("\(intArray)")
        
        intArray.remove(at: 5)
        print("\(intArray)")
        print("\n")
    }
    
    //set의 선언 및 기능 테스트
    func setTest()
    {
        let numSet1 : Set<Int> = [1,2,5,7,9]
        let numSet2 : Set<Int> = [1,3,7,9]
        let numSet3 : Set<Int> = [2,6,4,8,0]
        
        let interSec = numSet1.intersection(numSet2)
        print(interSec)
        let symMet = numSet2.symmetricDifference(numSet3)
        print(symMet)
        let unI = numSet3.union(numSet1).sorted()
        print(unI)
        let subStract = numSet1.subtracting(numSet3).sorted()
        print(subStract)
    }
    
    //dictionary의 선언 및 기능 테스트
    func dictionaryTest()
    {
        var dicTion : [String:Any] = ["Name" : "박상욱", "Age" : 26, "weight" : 78.6, "tall" : 185]
        
        //딕셔너리 개수
        print("\(dicTion.count)")
        
        //딕셔너리 빈공간 확인
        print("\(dicTion.isEmpty)")
        
        //딕셔너리 introduce키 추가
        dicTion.updateValue("반갑습니다", forKey: "introduce")
        print("\(dicTion)")
        
        //딕셔너리 Name키 값 수정
        dicTion.updateValue("park sangwook", forKey: "Name")
        print(dicTion)
        
        //딕셔너리 tall값 삭제
        dicTion.removeValue(forKey: "tall")
        
        for (key, value) in dicTion {
            print("Key 값은 \(key)이고, 값은 \(value)이다.")
        }
        print("\(dicTion)")
        print("\n")
    }
    
    //MARK: 실습과제 : 기초
    /// 1. 시작과 끝수를 받아서 두 수 사이의 모든 수를 가지고 있는 배열 만들기
    ///
    /// - Parameters: 시작과 끝수를 받아온다.
    ///   - start: 배열의 시작값
    ///   - last: 배열의 마지막값
    /// - Returns: 만들어진 배열을 리턴
    func startAndLast(start : Int, last : Int) -> [Int] {
        var arr : [Int] = []
        for n in start...last {
            arr[n] = n
        }
        return arr
    }
    
    /// 2. 정수 타입의 배열을 입력받아 모든 배열의 수의 합을 리턴하는 함수
    ///
    /// - Parameter arr: 정수타입의 배열
    /// - Returns: 모든 배열의 수의 합
    func arrAllSum(arr : [Int]) -> Int {
        var sum : Int = 0
        for n in arr {
            sum += n
        }
        return sum
    }
    
    /// 3. 딕셔너리에 있는 모든 데이터 출력하는 함수
    ///
    /// - Parameter dic: 딕셔너리
    func dicotionaryPrint(dic : [String:Any]) {
        for (key, value) in dic {
            print("키 : \(key) 값 : \(value)")
        }
    }
    
    //MARK: 실습과제 : 중급
    /// 1. 정수 타입의 배열을 받아서 배열안의 중복돤 수를 모두 제거된 배열을 반환하는 함수
    /// : set에 값을 넣을시에 자동으로 중복 제거 -> set을 정렬하면 배열로 인식 -> arrTemp에 넣어준다.
    /// - Parameter arr: 정수 타입의 배열
    /// - Returns: 중복된 수를 모두 제거된 배열
    func setToArr(arr : [Int]) -> [Int] {
        var arrTemp : [Int] = []
        var setTemp : Set<Int> = []
        for i in 0...arr.count - 1
        {
            setTemp.insert(arr[i])
        }
        arrTemp = setTemp.sorted()
        return arrTemp
        }
    
    /* 다른방법
     func (arr : [Int]) -> [Int] {
     var arrTemp : [Int] = []
     for index in arr {
        if !arrTemp.contatins(index)
             {
                arrTemp.append(index)
             }
        }
        return arrTemp
     }
    */
    
    //2. 정수 배열을 입력받아, 배열의 요소 중 두 개를 선택하는 조합을 모두 포함하는 배열을 작성하세요.
    func arrAddArray(arr : [Int]) -> [[Int]] {
        var arrTemp : [[Int]] = []
        for i in 0..<arr.count
        {
            for j in i+1..<arr.count
            {
                arrTemp.append([arr[i], arr[j]])
            }
        }
        return arrTemp
    }
    
    //MARK: 실습과제 : 고급
    //1. 정수 타입의 배열을 입력받아서 오름차순으로 정렬된 배열을 만들어 리턴하시오.
    //정렬 함수 사용x / 정렬의 효율은 보지 않습니다.
    func arrSort(arr : [Int]) -> [Int] {
        var arrTemp : [Int] = arr
        var numTemp : Int = 0
        for i in 0..<arrTemp.count
        {
            for j in i+1..<arrTemp.count
            {
                if arrTemp[i] > arrTemp[j]
                {
                    numTemp = arrTemp[i]
                    arrTemp[i] = arrTemp[j]
                    arrTemp[j] = numTemp
                }
            }
        }
        return arrTemp
    }
    
    func selectionSort(arr : [Int])-> [Int] {
        var arrTemp : [Int] = arr
        for number in 0..<arrTemp.count {
            for index in number+1..<arrTemp.count {
                if arrTemp[number] > arrTemp[index] {
                    arrTemp.swapAt(number, index)
                }
            }
        }
        return arrTemp
    }
    
    //에라토스테체 알고리즘을 이용하여 입력된 숫자까지의 모든 소수의 배열을 반환하는 함수
    func eratos(number : Int) -> [Int]
    {
        var resultArray : [Int] = []
        
        for index in 1...number
        {
            if index % 2 != 0 || index == 2
            {
                if index % 3 != 0 || index == 3
                {
                    if index % 5 != 0 || index == 5
                    {
                        if index % 7 != 0 || index == 7
                        {
                            resultArray.append(index)
                        }
                    }
                }
            }
        }
        return resultArray
    }
}
