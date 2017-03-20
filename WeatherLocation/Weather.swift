//
//  Weather.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    
    var tempAvg : Int?
    
    var tempDay : Double?
    var tempMin : Double?
    var tempMax : Double?
    var tempNight : Double?
    var tempEve : Double?
    var tempMorn : Double?
    
    var pressure : Double?
    var humidity : Int?
    
    var main : String?
    var mainDescription : String?
    var iconId : String?
    
    var speed : Double?
    var deg : Int?
    var clouds : Double?
    var rain : Double?
    

    //var iconImage : UIImage?
    
    
     var iconImage: UIImage? {
        get {
            
            if self.iconImage != nil {
                return self.iconImage
            } else {
                //call method
                return nil
            }
     
        }
        
        set {
            self.iconImage = newValue
        }
    }
    

    
    func addValue<T>(_ tagName: String, withValue value: T) {  //for class
    //mutating func addValue<T>(_ tagName: String, withValue value: T) {
        
        switch tagName {
            
            
        case JsonDocTags.HUMIDITY_TAG:
            
            
            if value is Int {
                
                humidity = (value as? Int)!
                
                print("**** in weather class *** humidity is \(humidity)")
            }
            
            
        case JsonDocTags.PRESSURE_TAG:
            
            
            if value is Double {
                
                pressure = (value as? Double)!
                
                print("**** in weather class *** pressure is \(pressure)")
            }
            
            
        case JsonDocTags.SPEED_TAG:
            
            if value is Double {
                
                speed = (value as? Double)!
                
                print("**** in weather class *** speed is \(speed)")
            }
            
            
        case JsonDocTags.DEG_TAG:
            
            if value is Int {
                
                deg = (value as? Int)!
                
                print("**** in weather class *** deg is \(deg)")
            }
            
            
        case JsonDocTags.CLOUDS_TAG:
            
            if value is Double {
                
                clouds = (value as? Double)!
                
                print("**** in weather class *** clouds is \(clouds)")
            }
            
            
        case JsonDocTags.RAIN_TAG:
            
            if value is Double {
                
                rain = (value as? Double)!
                
                print("**** in weather class *** rain is \(rain)")
            }


            
            
        case JsonDocTags.DAY_TAG:
            
            if value is Double {
                
                let x = (value as? Double)!
                
                tempDay = Double(round(1000*x)/1000)
                
                print("**** in weather class *** tempDay is \(tempDay)")
            }
            
            
        case JsonDocTags.NIGHT_TAG:
            
            if value is Double {
                
                tempNight = (value as? Double)!
                
                print("**** in weather class *** tempNight is \(tempNight)")
            }
            
            
            
        case JsonDocTags.MIN_TAG:
            
            if value is Double {
                
                tempMin = (value as? Double)!
                
                print("**** in weather class *** tempMin is \(tempMin)")
            }

            
        case JsonDocTags.MAX_TAG:
            
            if value is Double {
                
                tempMax = (value as? Double)!
                
                print("**** in weather class *** tempMax is \(tempMax)")
            }

            
        case JsonDocTags.EVE_TAG:
            
            if value is Double {
                
                tempEve = (value as? Double)!
                
                print("**** in weather class *** tempEve is \(tempEve)")
            }
            

            
            
        case JsonDocTags.MORN_TAG:
            
            if value is Double {
                
                tempMorn = (value as? Double)!
                
                print("**** in weather class *** tempMorn is \(tempMorn)")
            }
            
            
            
            
            
        case JsonDocTags.MAIN_TAG:
            
            if value is String {
                
                main = (value as? String)!
                
                print("**** in weather class *** main is \(main)")
            }
            

            
        case JsonDocTags.DESCRIPTION_TAG:
            
            if value is String {
                
                mainDescription = (value as? String)!
                
                print("**** in weather class *** mainDescription is \(mainDescription)")
            }
            
            
        case JsonDocTags.ICON_TAG:
            
            if value is String {
                
                iconId = (value as? String)!
                
                print("**** in weather class *** iconId is \(iconId)")
            }

            
        default:
            print("Unknown element \(tagName)")
            
        }
        
    }

    
    
    
    
    
    
    
    
    
    
    
}
