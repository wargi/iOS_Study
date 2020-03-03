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

import Foundation



struct Forecast: Codable {
   struct Weather: Codable {
      struct Forecast3Days: Codable {
         struct Fcst3Hour: Codable {
            @objcMembers class Sky: NSObject, Codable {
               let code4hour: String
               let name4hour: String
               let code7hour: String
               let name7hour: String
               let code10hour: String
               let name10hour: String
               let code13hour: String
               let name13hour: String
               let code16hour: String
               let name16hour: String
               let code19hour: String
               let name19hour: String
               let code22hour: String
               let name22hour: String
               let code25hour: String
               let name25hour: String
               let code28hour: String
               let name28hour: String
               let code31hour: String
               let name31hour: String
               let code34hour: String
               let name34hour: String
               let code37hour: String
               let name37hour: String
               let code40hour: String
               let name40hour: String
               let code43hour: String
               let name43hour: String
               let code46hour: String
               let name46hour: String
               let code49hour: String
               let name49hour: String
               let code52hour: String
               let name52hour: String
               let code55hour: String
               let name55hour: String
               let code58hour: String
               let name58hour: String
               let code61hour: String
               let name61hour: String
               let code64hour: String
               let name64hour: String
               let code67hour: String
               let name67hour: String
            }
            
            @objcMembers class Temperature: NSObject, Codable {
               let temp4hour: String
               let temp7hour: String
               let temp10hour: String
               let temp13hour: String
               let temp16hour: String
               let temp19hour: String
               let temp22hour: String
               let temp25hour: String
               let temp28hour: String
               let temp31hour: String
               let temp34hour: String
               let temp37hour: String
               let temp40hour: String
               let temp43hour: String
               let temp46hour: String
               let temp49hour: String
               let temp52hour: String
               let temp55hour: String
               let temp58hour: String
               let temp61hour: String
               let temp64hour: String
               let temp67hour: String
            }
            
            let sky: Sky
            let temperature: Temperature
            
            func arrayRepresentation() -> [WeatherData] {
               var data = [WeatherData]()
               let now = Date()
               
               for hour in stride(from: 4, to: 67, by: 3) {
                  var key = "code\(hour)hour"
                  guard let skyCode = sky.value(forKey: key) as? String else {
                     continue
                  }
                  
                  key = "name\(hour)hour"
                  guard let skyName = sky.value(forKey: key) as? String else {
                     continue
                  }
                  
                  key = "temp\(hour)hour"
                  let tempStr = temperature.value(forKey: key) as? String ?? "0.0"
                  guard let temp = Double(tempStr) else { continue }
                  
                  let date = now.addingTimeInterval(TimeInterval(hour) * 60 * 60)
                  
                  let forecast = WeatherData(date: date, weatherCode: skyCode, weatherDescription: skyName, temperature: temp, maxTemperature: nil, minTemperature: nil)
                  data.append(forecast)
               }
               
               return data
            }
            
         }
         
         let fcst3hour: Fcst3Hour
      }
      
      let forecast3days: [Forecast3Days]
   }
   
   struct Result: Codable {
      let code: Int
      let message: String
   }
   
   let weather: Weather
   let result: Result
}
