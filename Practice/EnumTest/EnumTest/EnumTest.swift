//
//  EnumTest.swift
//  EnumTest
//
//  Created by 박상욱 on 2018. 2. 27..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

enum Planet: Int{
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Wearable {
    enum Weight: Int {
        case Light = 1
    }
    enum Armor: Int {
        case Light = 2
    }
    case Helmet(weight: Weight, armor: Armor)
    func attributes() -> (weight: Int, armor: Int) {
        switch self {
        case .Helmet(let w, let a):
            return (weight: w.rawValue * 2,
                    armor: a.rawValue * 4)
        }
    }
}
