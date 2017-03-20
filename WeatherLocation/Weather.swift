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
    
    
//    fetchProfileImage() { (imageFile, name, error) in
//    if error == nil {
//    // put into UIImage with imageFile/name
//    }
//    
//    
//    let myStringFile = imageFile
//    
//    
//    print(myStringFile)
//    
//    
//    
//    }
//    
//    
//}




//    One way that a closure can escape is by being stored in a variable that is defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later. For example:


//func closureReturn(isTest: Bool, withCompletionHandler:(_ result:Type) -> Void) {
//func closureReturn(isTest: Bool, withCompletionHandler: @escaping (String) -> Void) {
//    
//    
//    if isTest {
//        withCompletionHandler("Yes")
//    } else {
//        withCompletionHandler("No")
//    }
//    
//    
//}



    func fetchIconImage(imageID: String, imageCompletionHandler: @escaping (UIImage) -> Void) {
    
    if iconImage != nil {
        
        imageCompletionHandler(iconImage!)
        
    } else {
        
        let weatherResultsClosure : HttpConnect.weatherDataFromURL = {
            
            if let imageData = $1 {
                
               // if let imageData = data {
                    // Finally convert that Data into an image and do what you wish with it.
                    let image = UIImage(data: imageData)
                    // Do something with your image.
                    self.iconImage = image
                
                  imageCompletionHandler(image!)
                
                
                } else {
                    print("Couldn't get image: Image is nil")
                }

                    

                
            }
        
        //http://openweathermap.org/img/w/10d.png
        
        let aConnect = HttpConnect()
        aConnect.sendGetRequest(urlString: "http://openweathermap.org/img/w/10d.png", weatherResultsClosure)
        
        
        
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
