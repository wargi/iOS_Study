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
