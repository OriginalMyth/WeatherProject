//
//  WeatherViewController.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
//    var weatherDataForecast : String?
//    var weatherData : String = ""
    
    let weatherDataHandler = WeatherData.sharedInstance
    let jsonHelper = JsonHelper()

    @IBOutlet weak var forecastButton: UIButton!
    @IBAction func forecastButtonClick(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        



        let disclosure = UITableViewCell()
        disclosure.frame = forecastButton.bounds
        disclosure.accessoryType = .disclosureIndicator
        disclosure.isUserInteractionEnabled = false
        
        forecastButton.addSubview(disclosure)
        
//        weatherData = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data", ofType:"json"))
//        weatherDataForecast = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data_forecast", ofType:"json"))

        
        let weatherResultsClosure : HttpConnect.weatherDataFromURL = {
            
            
            if let data = $1 {
                
                
                //let mString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                
                
                do {
                    //try self.jsonHelper.parseJson(jsonString: self.vehiclesString, weatherData : self.vehiclesDataHandler)
                    //try self.jsonHelper.parseJson(jsonString: String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!)
                    
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
                
            }
            
            
        }
        
        
        
        let aConnect = HttpConnect()
        aConnect.sendGetRequest(urlString: Constants.FIVEDAYWEATHERURLSTRING, weatherResultsClosure)
        
        
//        do {
//            //try self.jsonHelper.parseJson(jsonString: self.vehiclesString, weatherData : self.vehiclesDataHandler)
//            try self.jsonHelper.parseJson(jsonString: self.weatherDataForecast!)
//
//            
//        } catch let error {
//            print(error.localizedDescription)
//        }
        
        
        // MARK: - TODO - show day of the week
        getDay()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    /*
     Loads test data from local storage
     */
    func retrieveJsonStringFromBundle(filePath: String?) -> String {
        
        if let vehicleData =  try? Data(contentsOf: URL(fileURLWithPath: filePath!), options: Data.ReadingOptions.uncached) {
            
            return String(data: vehicleData, encoding: .utf8)!
            
        }else {
            print("Invalid filename/path.")
            return ""
            
        }
        
        
    }
    
    
    func getDay() -> String {
        
        
        let date = Date()
        
      //  let calendar = Calendar.current
    //    let day = calendar.component(.day, from: date)
        
        print("today extension is \(date.dayOfTheWeek())")
    
        return date.dayOfTheWeek()!
        
    }
    
    
    
    
    
    

}
