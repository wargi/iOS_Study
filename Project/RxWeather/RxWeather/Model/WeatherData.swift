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
import RxCocoa
import RxDataSources

struct WeatherData: WeatherDataType, Equatable {
   let date: Date?
   let weatherCode: String
   let weatherDescription: String
   let temperature: Double
   let maxTemperature: Double?
   let minTemperature: Double?
}

extension WeatherData {
   init(summary: WeatherSummary) {
      date = Date()
      weatherCode = summary.weather.minutely[0].sky.code
      weatherDescription = summary.weather.minutely[0].sky.name
      temperature = Double(summary.weather.minutely[0].temperature.tc) ?? 0
      maxTemperature = Double(summary.weather.minutely[0].temperature.tmax) ?? 0
      minTemperature = Double(summary.weather.minutely[0].temperature.tmin) ?? 0
   }
}

extension WeatherData: IdentifiableType {
   var identity: Double {
      return date?.timeIntervalSinceReferenceDate ?? 0
   }
}
