//
//  ViewController.swift
//  Serialization
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
      private var dirPath: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
      }
      private let customClass1 = CustomClass1(name: "giftbot", job: "iOS Developer")
      private let customClass2 = CustomClass2(name: "giftbot", job: "iOS Developer")
      private let customClass3 = CustomClass3(name: "giftbot", job: "iOS Developer")
      private let customClass4 = CustomClass4(name: "giftbot", job: "iOS Developer")

      private func basicSerialization() {
        // String
        let str = "iOS School"
        _ = try? str.write(toFile: dirPath + "/string", atomically: true, encoding: .utf8)
        let loadString = try? String(contentsOfFile: dirPath + "/string", encoding: .utf8)
        print(loadString ?? "Failed")
        print(dirPath)
        
        // Array
        let arr = Array(1...9)
        _ = (arr as NSArray).write(toFile: dirPath + "/arr", atomically: true)
        let loadArray = NSArray(contentsOfFile: dirPath + "/arr") as? [Int]
        print(loadArray ?? "Failed")

        // Data
        let url = URL(fileURLWithPath: dirPath + "/color")
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: UIColor.blue)
        try? archivedData.write(to: url)
        if let savedData = try? Data(contentsOf: url) {
            let blueColor = NSKeyedUnarchiver.unarchiveObject(with: savedData) as? UIColor
            print(blueColor ?? .clear)
        }
        
    }
    
      private func saveCustomClassWithoutSerialization() {
        let filePath = dirPath + "/normalData.dat"
        let myClass = CustomClass1(name: "giftbot", job: "iOS Developer")
        let myClassArr = [myClass] as NSArray
        let result = myClassArr.write(toFile: filePath, atomically: true)
        print("Save result :", result)
    
        // fatalError
//        _ = NSKeyedArchiver.archiveRootObject(myClass, toFile: filePath)
      }

      private func saveCustomClassWithSerialization() {
        let filePath = dirPath + "/archivedData.dat"
        let result = NSKeyedArchiver.archiveRootObject(customClass2, toFile: filePath)
        print("Save result :", result, terminator: "\n\n")
    
        // UserDefaults
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: customClass2)
        UserDefaults.standard.set(archivedData, forKey: "customClass2")
      }
    
      private func handleMutableData() {
        let mData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: mData)
        archiver.encode(true, forKey: "boolType")
        archiver.encode(10, forKey: "intType")
        archiver.encode(3.14, forKey: "doubleType")
        archiver.encode("HelloWorld!", forKey: "stringType")
        archiver.encode([1,2,3,4], forKey: "arrayType")
        archiver.encode(["key": "value"], forKey: "dictionaryType")
        //    archiver.encode(customClass1, forKey: "customClass")
        archiver.encode(customClass2, forKey: "customClass")
        archiver.finishEncoding()
    
        let unarchiver = NSKeyedUnarchiver(forReadingWith: mData as Data)
        print(unarchiver.decodeBool(forKey: "boolType"))
        print(unarchiver.decodeInteger(forKey: "intType"))
        print(unarchiver.decodeDouble(forKey: "doubleType"))
        print(unarchiver.decodeObject(forKey: "stringType") as! String)
        print(unarchiver.decodeObject(forKey: "arrayType") as! Array<Int>)
        print(unarchiver.decodeObject(forKey: "dictionaryType") as! Dictionary<String, String>)
        //    print(unarchiver.decodeObject(forKey: "customClass") as! CustomClass1)
        print(unarchiver.decodeObject(forKey: "customClass") as! CustomClass2)
        unarchiver.finishDecoding()
      }
    
      private func SerializationWithStruct() {
        // Codable 이 나오기 전에는 개별 속성별 인코딩 또는 헬퍼 class 를 만들었어야만 가능
        let myStruct = StructType(name: "giftbot", job: "iOS Developer")
        let mData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: mData)
        archiver.encode(myStruct.name, forKey: "name")
        archiver.encode(myStruct.job, forKey: "job")
        archiver.finishEncoding()
    
        let unarchiver = NSKeyedUnarchiver(forReadingWith: mData as Data)
        let name = unarchiver.decodeObject(forKey: "name") as! String
        let job = unarchiver.decodeObject(forKey: "job") as! String
        unarchiver.finishDecoding()
    
        let decodedStruct = StructType(name: name, job: job)
        print(decodedStruct)
      }
    
      private func secureCodingExample() {
        let filePath = dirPath + "/secureCodingData.dat"
        let result = NSKeyedArchiver.archiveRootObject(customClass3, toFile: filePath)
        print("Case5 Save result :", result, terminator: "\n\n")
    
        if let myClass = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? CustomClass3 {
          print("== Decoded Data == ")
          print("name :", myClass.name)
          print("job :", myClass.job)
        } else {
          print("Failed to load")
        }
      }
    
      private func withCodable() {
//        클래스 내부에 쉽게 작성 했을 시 코드
//        customClass4.encoded()
//        let result = CustomClass4.decode()
//
//        print("== Decoded Data == ")
//        print("name :", decodedClass.name)
//        print("job :", decodedClass.job)
        
        //Encoding
        let filePath = dirPath + "/codable.dat"
        let classData = try! JSONEncoder().encode(customClass4)
        let url = URL(fileURLWithPath: filePath)
        try? classData.write(to: url)
        
        let data = try! Data(contentsOf: url)
        let decodedClass = try! JSONDecoder().decode(CustomClass4.self, from: data)
        
        print("== Decoded Data == ")
        print("name :", decodedClass.name)
        print("job :", decodedClass.job)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicSerialization()
        saveCustomClassWithoutSerialization()
        saveCustomClassWithSerialization()
        handleMutableData()
        withCodable()
    }
    
    
    
}



// NSCoding - iOS 2+,
// NSSecureCoding - iOS 6+
// Codable - Swift4
//final class ViewController: UIViewController {
//

//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    case1()
////    case2()
////    case3()
////    case4()
////    case5()
////    case6()
//  }
//
//  // MARK: - Test Case
//
//  private func case1() {
//    basicSerialization()
//  }
//
//  private func case2() {
//    saveCustomClassWithoutSerialization()
//  }
//
//  private func case3() {
//    saveCustomClassWithSerialization()
//    loadCustomClass()
//  }
//
//  private func case4() {
//    handleMutableData()
//    SerializationWithStruct()
//  }
//
//  private func case5() {
//    withCodable()
//  }
//
//  private func case6() {
//    withCodable()
//  }
//
//
//
//  // MARK: - Action
//
//  // MARK: Case 1
//
//  private func basicSerialization() {
//    // String
//    let str = "iOS School"
//    _ = try? str.write(toFile: dirPath + "/string", atomically: true, encoding: .utf8)
//    let loadString = try? String(contentsOfFile: dirPath + "/string", encoding: .utf8)
//    print(loadString ?? "Failed")
//
//    // Array
//    let arr = Array(1...9)
//    _ = (arr as NSArray).write(toFile: dirPath + "/arr", atomically: true)
//    let loadArray = NSArray(contentsOfFile: dirPath + "/arr") as? [Int]
//    print(loadArray ?? "Failed")
//
//    // Data
//    let url = URL(fileURLWithPath: dirPath + "/color")
//    let archivedData = NSKeyedArchiver.archivedData(withRootObject: UIColor.blue)
//    try? archivedData.write(to: url)
//    if let savedData = try? Data(contentsOf: url) {
//      let blueColor = NSKeyedUnarchiver.unarchiveObject(with: savedData) as? UIColor
//      print(blueColor ?? .clear)
//    }
//  }
//
//  // MARK: Case 2
//
//  private func saveCustomClassWithoutSerialization() {
//    let filePath = dirPath + "/normalData.dat"
//    let myClass = CustomClass1(name: "giftbot", job: "iOS Developer")
//    let myClassArr = [myClass] as NSArray
//    let result = myClassArr.write(toFile: filePath, atomically: true)
//    print("Save result :", result)
//
//    // fatalError
////    let result = NSKeyedArchiver.archiveRootObject(myClass, toFile: filePath)
//  }
//
//  // MARK: Case 3
//
//  private func saveCustomClassWithSerialization() {
//    let filePath = dirPath + "/archivedData.dat"
//    let result = NSKeyedArchiver.archiveRootObject(customClass2, toFile: filePath)
//    print("Save result :", result, terminator: "\n\n")
//
//    // UserDefaults
//    let archivedData = NSKeyedArchiver.archivedData(withRootObject: customClass2)
//    UserDefaults.standard.set(archivedData, forKey: "customClass2")
//  }
//
//  //동일한 파일 패스를 지정해주고 불러준다.
//  private func loadCustomClass() {
//    let filePath = dirPath + "/archivedData.dat"
//    if let myClass = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? CustomClass2 {
//      print("== Decoded Data == ")
//      print("name :", myClass.name)
//      print("job :", myClass.job)
//    } else {
//      print("Failed to load")
//    }
//
//    if let encodedData = UserDefaults.standard.object(forKey: "customClass2") as? Data {
//      if let myClass = NSKeyedUnarchiver.unarchiveObject(with: encodedData) as? CustomClass2 {
//        print("== Decoded Data == ")
//        print("name :", myClass.name)
//        print("job :", myClass.job)
//      }
//    }
//  }
//
//  // MARK: Case 4
//
//  private func handleMutableData() {
//    let mData = NSMutableData()
//    let archiver = NSKeyedArchiver(forWritingWith: mData)
//    archiver.encode(true, forKey: "boolType")
//    archiver.encode(10, forKey: "intType")
//    archiver.encode(3.14, forKey: "doubleType")
//    archiver.encode("HelloWorld!", forKey: "stringType")
//    archiver.encode([1,2,3,4], forKey: "arrayType")
//    archiver.encode(["key": "value"], forKey: "dictionaryType")
//    //    archiver.encode(customClass1, forKey: "customClass")
//    archiver.encode(customClass2, forKey: "customClass")
//    archiver.finishEncoding()
//
//    let unarchiver = NSKeyedUnarchiver(forReadingWith: mData as Data)
//    print(unarchiver.decodeBool(forKey: "boolType"))
//    print(unarchiver.decodeInteger(forKey: "intType"))
//    print(unarchiver.decodeDouble(forKey: "doubleType"))
//    print(unarchiver.decodeObject(forKey: "stringType") as! String)
//    print(unarchiver.decodeObject(forKey: "arrayType") as! Array<Int>)
//    print(unarchiver.decodeObject(forKey: "dictionaryType") as! Dictionary<String, String>)
//    //    print(unarchiver.decodeObject(forKey: "customClass") as! CustomClass1)
//    print(unarchiver.decodeObject(forKey: "customClass") as! CustomClass2)
//    unarchiver.finishDecoding()
//  }
//
//  private func SerializationWithStruct() {
//    // Codable 이 나오기 전에는 개별 속성별 인코딩 또는 헬퍼 class 를 만들었어야만 가능
//    let myStruct = StructType(name: "giftbot", job: "iOS Developer")
//    let mData = NSMutableData()
//    let archiver = NSKeyedArchiver(forWritingWith: mData)
//    archiver.encode(myStruct.name, forKey: "name")
//    archiver.encode(myStruct.job, forKey: "job")
//    archiver.finishEncoding()
//
//    let unarchiver = NSKeyedUnarchiver(forReadingWith: mData as Data)
//    let name = unarchiver.decodeObject(forKey: "name") as! String
//    let job = unarchiver.decodeObject(forKey: "job") as! String
//    unarchiver.finishDecoding()
//
//    let decodedStruct = StructType(name: name, job: job)
//    print(decodedStruct)
//  }
//
//
//  // MARK: Case 5
//
//  private func secureCodingExample() {
//    let filePath = dirPath + "/secureCodingData.dat"
//    let result = NSKeyedArchiver.archiveRootObject(customClass3, toFile: filePath)
//    print("Case5 Save result :", result, terminator: "\n\n")
//
//    if let myClass = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? CustomClass3 {
//      print("== Decoded Data == ")
//      print("name :", myClass.name)
//      print("job :", myClass.job)
//    } else {
//      print("Failed to load")
//    }
//  }
//
//
//  // MARK: Case 6
//
//  private func withCodable() {
//    customClass4.encoded()
//    let result = CustomClass4.decode()
//    print("== Decoded Data == ")
//    print("name :", result.name)
//    print("job :", result.job)
//  }
//}
//
