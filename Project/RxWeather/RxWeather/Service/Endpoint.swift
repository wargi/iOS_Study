import Foundation
import CoreLocation

let summaryEndpoint = "https://apis.openapi.sk.com/weather/current/minutely"
let forecastEndpoint = "https://apis.openapi.sk.com/weather/forecast/3days"

func composeUrlRequest(endpoint: String, from location: CLLocation) -> URLRequest {
   let urlStr = "\(endpoint)?version=1&lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appKey=\(apiKey)"
   let url = URL(string: urlStr)!
   return URLRequest(url: url)
}
