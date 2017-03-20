//
//  WeatherLocationTests.swift
//  WeatherLocationTests
//
//  Created by TAE on 17/03/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import XCTest
@testable import WeatherLocation

class WeatherLocationTests: XCTestCase {
    
    
        var weatherDataForecast : String?
        var weatherData : String?
    
    override func setUp() {
        super.setUp()
        

        
        weatherData = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data", ofType:"json"))
        weatherDataForecast = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "weather_data_forecast", ofType:"json"))
        
        XCTAssertNotNil(weatherDataForecast,"Parsed JSON was nil")
        
    }
    
    func testParser() {
        
        let jsonHelper = JsonHelper()
        let weatherDataHandler = WeatherData.sharedInstance
        

        
        do {

            try jsonHelper.parseJson(jsonString: weatherDataForecast!, weatherData : weatherDataHandler)

            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
     

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
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
