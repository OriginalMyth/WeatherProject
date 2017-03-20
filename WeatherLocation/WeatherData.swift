//
//  WeatherData.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation

class WeatherData : WeatherDataProtocol {
    
    static let sharedInstance = WeatherData()
    
    //var weatherDict : [String: Weather]
    var weatherArray : [Weather]
    
    private init(){
        //weatherDict = [String: Weather]()
        weatherArray = Array <Weather>()
    }
    
    
    
}

