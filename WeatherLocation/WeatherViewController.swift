//
//  WeatherViewController.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
//    var weatherData : String?
    var weatherDataForecast : String?
    
    var weatherData : String = ""
//    var vehiclesGroupsString : String = ""
    
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
        
        weatherData = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data", ofType:"json"))
        weatherDataForecast = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data_forecast", ofType:"json"))
        
        
        do {
            //try self.jsonHelper.parseJson(jsonString: self.vehiclesString, weatherData : self.vehiclesDataHandler)
            try self.jsonHelper.parseJson(jsonString: self.weatherDataForecast!)

            
        } catch let error {
            print(error.localizedDescription)
        }
    
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

}
