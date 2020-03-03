//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension UIImage {
   static func from(code: String) -> UIImage? {
      guard code.hasPrefix("SKY_") && code.count == 7 else {
         return UIImage(systemName: "questionmark")
      }
      
      let lowerBound = code.index(code.startIndex, offsetBy: 5)
      guard let numberPart = Int(code[lowerBound...]) else {
         return UIImage(systemName: "questionmark")
      }
      
      switch numberPart {
      case 1:
         return UIImage(systemName: "sun.max")
      case 2, 3:
         return UIImage(systemName: "cloud.sun")
      case 4:
         return UIImage(systemName: "cloud.sun.rain")
      case 5, 9:
         return UIImage(systemName: "cloud.snow")
      case 6, 10:
         return UIImage(systemName: "cloud.rain")
      case 7:
         return UIImage(systemName: "cloud")
      case 8:
         return UIImage(systemName: "cloud.heavyrain")
      case 11:
         return UIImage(systemName: "cloud.bolt")
      case 12, 13, 14:
         return UIImage(systemName: "cloud.bolt.rain")
      default:
         return UIImage(systemName: "questionmark")
      }
   }
}
