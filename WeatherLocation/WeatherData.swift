//
//  WeatherData.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation

class WeatherData : WeatherDataProtocol {
    
    static let sharedInstance = WeatherData()
    
    var vehiclesDict : [Int: Weather]
    
    private init(){
        vehiclesDict = [Int: Weather]()
    }
    
    
    
}

