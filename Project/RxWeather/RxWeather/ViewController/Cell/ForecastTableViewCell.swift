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

class ForecastTableViewCell: UITableViewCell {
   
   static let identifier = "ForecastTableViewCell"
   
   @IBOutlet weak var dateLabel: UILabel!
   
   @IBOutlet weak var timeLabel: UILabel!
   
   @IBOutlet weak var weatherImageView: UIImageView!
   
   
   @IBOutlet weak var statusLabel: UILabel!
   
   @IBOutlet weak var temperatureLabel: UILabel!
   
   
   override func awakeFromNib() {
      super.awakeFromNib()
      
      backgroundColor = UIColor.clear
      
      statusLabel.textColor = UIColor.white
      dateLabel.textColor = statusLabel.textColor
      timeLabel.textColor = statusLabel.textColor
      temperatureLabel.textColor = statusLabel.textColor
   }
   
   func configure(from data: WeatherDataType, dateFormatter: DateFormatter, tempFormatter: NumberFormatter) {
      dateFormatter.dateFormat = "M.d (E)"
      dateLabel.text = dateFormatter.string(for: data.date)
      
      dateFormatter.dateFormat = "HH:00"
      timeLabel.text = dateFormatter.string(for: data.date)
      
      weatherImageView.image = UIImage.from(code: data.weatherCode)
      
      statusLabel.text = data.weatherDescription
      
      let tempStr = tempFormatter.string(for: data.temperature) ?? "-"
      temperatureLabel.text = "\(tempStr)º"
   }
}
