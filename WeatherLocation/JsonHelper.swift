//
//  JsonHelper.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class JsonHelper {


//func parseJson(jsonString: String, vehiclesData : WeatherDataProtocol?) throws {
  func parseJson(jsonString: String) throws {
    
    let jsonData = jsonString.data(using: String.Encoding.utf8)
    
    
    if let data = jsonData {
        
        let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        
        if let weather = (jsonDoc as AnyObject).object(forKey:"list") as? NSArray {
            
            
//            for i in 0 ..< weather.count {
//                
//                
//                print(i)
//                
//                
//            }

            
            for item in weather {
                
                  print(item)
            }
            
            
        }
        

        
        
        
    }
    
    
}






}

