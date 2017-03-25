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
    

    var iconImage : UIImage?
    

    func fetchIconImage(imageID: String, imageCompletionHandler: @escaping (UIImage) -> Void) {
    
    if iconImage != nil {
        
        imageCompletionHandler(iconImage!)
        
    } else {
        
        let weatherResultsClosure : HttpConnect.weatherDataFromURL = {
            
            if let imageData = $1 {
                
                    let image = UIImage(data: imageData)
                    self.iconImage = image
                
                  imageCompletionHandler(image!)
                
                
                } else {
                    print("Couldn't get image: Image is nil")
                }

                    

                
            }
        
        
        // MARK: - TODO - get individual image
        
        //http://openweathermap.org/img/w/10d.png
        
        
        let pngString = Constants.BASE_PNG_STRING + iconId! + Constants.END_PNG_STRING
        
        print(" pngString is... " + pngString)
        
        let aConnect = HttpConnect()
        //aConnect.sendGetRequest(urlString: "http://openweathermap.org/img/w/10d.png", weatherResultsClosure)
        aConnect.sendGetRequest(urlString: pngString, weatherResultsClosure)
        
        
        
    }
    
    
}




    
    func addValue<T>(_ tagName: String, withValue value: T) {  //for class
        
        switch tagName {
            
            
        case JsonDocTags.HUMIDITY_TAG:
            
            
            if value is Int {
                
                humidity = (value as? Int)!
                
            }
            
            
        case JsonDocTags.PRESSURE_TAG:
            
            
            if value is Double {
                
                pressure = (value as? Double)!
                
            }
            
            
        case JsonDocTags.SPEED_TAG:
            
            if value is Double {
                
                speed = (value as? Double)!
                
            }
            
            
        case JsonDocTags.DEG_TAG:
            
            if value is Int {
                
                deg = (value as? Int)!
                
            }
            
            
        case JsonDocTags.CLOUDS_TAG:
            
            if value is Double {
                
                clouds = (value as? Double)!
                
            }
            
            
        case JsonDocTags.RAIN_TAG:
            
            if value is Double {
                
                rain = (value as? Double)!
                
            }


            
            
        case JsonDocTags.DAY_TAG:
            
            if value is Double {
                
                tempDay = (value as? Double)!
                
            }
            
            
        case JsonDocTags.NIGHT_TAG:
            
            if value is Double {
                
                tempNight = (value as? Double)!
                
            }
            
            
            
        case JsonDocTags.MIN_TAG:
            
            if value is Double {
                
                tempMin = (value as? Double)!
                
            }

            
        case JsonDocTags.MAX_TAG:
            
            if value is Double {
                
                tempMax = (value as? Double)!
                
            }

            
        case JsonDocTags.EVE_TAG:
            
            if value is Double {
                
                tempEve = (value as? Double)!
                
            }
            

            
            
        case JsonDocTags.MORN_TAG:
            
            if value is Double {
                
                tempMorn = (value as? Double)!
                
            }
            
            
            
            
            
        case JsonDocTags.MAIN_TAG:
            
            if value is String {
                
                main = (value as? String)!
                
            }
            

            
        case JsonDocTags.DESCRIPTION_TAG:
            
            if value is String {
                
                mainDescription = (value as? String)!
                
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
