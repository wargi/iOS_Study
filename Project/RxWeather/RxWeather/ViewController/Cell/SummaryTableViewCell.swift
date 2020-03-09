import UIKit

class SummaryTableViewCell: UITableViewCell {
   static let identifier = "SummaryTableViewCell"
   
   @IBOutlet weak var weatherImageView: UIImageView!
   
   @IBOutlet weak var statusLabel: UILabel!
   
   @IBOutlet weak var minMaxLabel: UILabel!
   
   @IBOutlet weak var currentTemperatureLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
      
      backgroundColor = UIColor.clear
      
      statusLabel.textColor = UIColor.white
      minMaxLabel.textColor = statusLabel.textColor
      currentTemperatureLabel.textColor = statusLabel.textColor
    }

   func configure(from data: WeatherDataType, tempFormatter: NumberFormatter) {
      weatherImageView.image = UIImage.from(code: data.weatherCode)
      statusLabel.text = data.weatherDescription
      
      let max = data.maxTemperature ?? 0.0
      let min = data.minTemperature ?? 0.0
      
      let maxStr = tempFormatter.string(for: max) ?? "-"
      let minStr = tempFormatter.string(for: min) ?? "-"
      
      minMaxLabel.text = "최대 \(maxStr)º 최소 \(minStr)º"
            
      let currentStr = tempFormatter.string(for: data.temperature) ?? "-"
      
      currentTemperatureLabel.text = "\(currentStr)º"
   }
}
