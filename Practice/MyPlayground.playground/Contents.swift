//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let sampleText = "<<<Hello>>>"
let startIndex = sampleText.index(sampleText.startIndex, offsetBy: 3) // StringType
let endIndex = sampleText.index(sampleText.endIndex, offsetBy: -4) // StringType

let substring1: Substring = sampleText[startIndex...endIndex]
let resultStr:String = String(substring1) // “Hello”

var sampleTuple : (height : Int, weight : Int, name : String, age : Int) = (185, 78, "박상욱", 26)

let resultValue : (value : Int,valueString : String)

func calculator(num:Int, num1:Int) -> (Int, String)
{
    let sum:Int = num + num1
    
    return (sum, String(sum))
}

var stringNum : Int
var doubleNum : Double
var intNum : String = "3"

let PI : Double = 3.141592



// 사각형의 가로, 세로 길이를 보내주고 넓이를 구해주는 함수
func rectanglerArea(width : Int, depth : Int) -> Int
{
    return width * depth
}

//정사각형의 넓이를 구하는 함수
//결과가 사각형의 넓이를 구하는 연산과 같음으로 사각형의 넓이를 구해주는 함수로 값을 보내줘서 연산을 한다
func squareArea(height : Int) -> Int
{
    return rectanglerArea(width: height, depth: height)
}

func rectanglerPerimeter(width : Int, depth : Int) -> Int
{
    return (2 * width) + (2 * depth)
}

func squareAndPerimeter(height : Int) -> Int
{
    return rectanglerPerimeter(width: height, depth: height)
}

func rectangleularSoild(width : Int, depth : Int, height : Int) -> Int
{
    return height * rectanglerArea(width: width, depth: depth)
}

func cube(length : Int) -> Int
{
    return length * rectanglerArea(width: length, depth: length)
}

func circleArea(r : Double) -> Double
{
    return PI * (r * r)
}

func circleCircumference(r : Double) -> Double
{
    return 2 * PI * r
}

func circularCylinder(r : Double, height : Int) -> Double
{
    return Double(height) * circleArea(r: r)
}

func sphere(r : Double, height : Int) -> Double
{
    return (4/3) * PI * (r * r * r) * Double(height)
}

func triangleArea(bottom : Int, height : Int) -> Double
{
    return Double(bottom) * Double(height) / 2
}

func trapezoid(top : Int, bottom : Int, height : Int) -> Double
{
    return round(triangleArea(bottom: top + bottom, height: height))
}

func cone(r : Double, height : Int) -> Double
{
    return circularCylinder(r: r, height: height) / 3
}

stringNum = Int(intNum)!
resultValue = calculator(num: sampleTuple.height, num1: sampleTuple.weight)

print(resultStr)
print("내이름은 \(sampleTuple.name)이고 나이는 \(sampleTuple.age)살이며 키는 \(sampleTuple.height)CM이고 몸무게는 \(sampleTuple.weight)KG이다")
print(resultValue)

