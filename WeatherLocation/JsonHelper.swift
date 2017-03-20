//
//  JsonHelper.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class JsonHelper {

    
    
    

//func parseJson(jsonString: String, weatherData : WeatherDataProtocol?) throws {
  func parseJson(jsonString: String) throws {
    
    let jsonData = jsonString.data(using: String.Encoding.utf8)
    
    
    if let data = jsonData {
        
        let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        

        
        
    if let weatherArray = (jsonDoc as AnyObject).object(forKey:"list") as? NSArray {
        
         for i in 0 ..< weatherArray.count {
            
            
            if let weatherObject = weatherArray.object(at: i) as? AnyObject {
                
                //print(weatherObject)
                let weather = Weather()
                
                
                addElementToWeather(weather, elementName: JsonDocTags.HUMIDITY_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.HUMIDITY_TAG) as AnyObject))
                //addElementToWeather(weather, elementName: "humidity", elementValue: (weatherObject.object(forKey: "humidity") as AnyObject))
                
//                if let dictKey = weatherObject.object(forKey: "humidity") as? Int {
//                                    }
                
                addElementToWeather(weather, elementName: JsonDocTags.PRESSURE_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.PRESSURE_TAG) as AnyObject))
//                if let dictKey = weatherObject.object(forKey: "pressure") as? Int {
//                    
//                    print("**** pressure is \(dictKey)")
//                    
//                }
                
                if let dictObjectKey = weatherObject.object(forKey: JsonDocTags.TEMP_TAG) as? AnyObject {//Is an jsonObject
                
                    addElementToWeather(weather, elementName: JsonDocTags.DAY_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.DAY_TAG) as AnyObject))
                    addElementToWeather(weather, elementName: JsonDocTags.NIGHT_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.NIGHT_TAG) as AnyObject))
                    addElementToWeather(weather, elementName: JsonDocTags.MIN_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.MIN_TAG) as AnyObject))
                    addElementToWeather(weather, elementName: JsonDocTags.MAX_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.MAX_TAG) as AnyObject))
                    addElementToWeather(weather, elementName: JsonDocTags.EVE_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.EVE_TAG) as AnyObject))
                    addElementToWeather(weather, elementName: JsonDocTags.MORN_TAG, elementValue: (dictObjectKey.object(forKey: JsonDocTags.MORN_TAG) as AnyObject))

                    
                }
                
                //if let innerWeatherArray = weatherObject.object(forKey: "weather") as? NSArray {//Is an jsonArray contains a JsonObject
                    if let innerWeatherArray = weatherObject.object(forKey: JsonDocTags.WEATHER_TAG) as? NSArray {//Is an jsonArray contains a JsonObject
                    
                    //Only gets the first **Priority** value
                    if let innerWeatherObject = innerWeatherArray.object(at: 0) as? AnyObject {
               

                        addElementToWeather(weather, elementName: JsonDocTags.MAIN_TAG, elementValue: (innerWeatherObject.object(forKey: JsonDocTags.MAIN_TAG) as AnyObject))
                        addElementToWeather(weather, elementName: JsonDocTags.DESCRIPTION_TAG, elementValue: (innerWeatherObject.object(forKey: JsonDocTags.DESCRIPTION_TAG) as AnyObject))
                        addElementToWeather(weather, elementName: JsonDocTags.ICON_TAG, elementValue: (innerWeatherObject.object(forKey: JsonDocTags.ICON_TAG) as AnyObject))

                        
                    }
                    
                }
                
                
                
                addElementToWeather(weather, elementName: JsonDocTags.SPEED_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))
                addElementToWeather(weather, elementName: JsonDocTags.DEG_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.DEG_TAG) as AnyObject))
                addElementToWeather(weather, elementName: JsonDocTags.CLOUDS_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.CLOUDS_TAG) as AnyObject))
                addElementToWeather(weather, elementName: JsonDocTags.RAIN_TAG, elementValue: (weatherObject.object(forKey: JsonDocTags.RAIN_TAG) as AnyObject))

                
              //  weatherData.weatherDict[] = weather
                
                
                
                

                
                
            }
            
        }
        
        
            
        
        
    }


}
}//end of parse method
    
    
    private func addElementToWeather(_ weather: Weather, elementName: String, elementValue: AnyObject?) {
        if let value = elementValue {
            
            weather.addValue(elementName, withValue: value)
        }
    }


}





//if let weather = (jsonDoc as AnyObject).object(forKey:"list") as? NSDictionary {
//    
//    print("In weether")
//    
//    
//    if let dictKey = weather.object(forKey: "humididty") as? Int {
//        
//        print("In humidity")
//        
//        
//}





//        if let weather = (jsonDoc as AnyObject).object(forKey:"list") as? NSArray {
//            
//            
//            for i in 0 ..< weather.count {
//                
//                
//                
//                //let dictKey = dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int ?? -1
//
////                if let dictKey = weather.object(forKey: "weather") as? Int {
////
////                }
////                
////                (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
////
////                
////                
////                if let dict = weather[i] as? NSDictionary {
////
////                }
//                
//                
//            }

            
            
//            for i in 0 ..< weather.count {
//                
//                
//                print(i)
//                
//                
//            }

        
        
        
        
        
        
        
        
            
//            for item in weather {
//                
//                  print(item)
//            }
        
            
   //     }
        

        
        
//        
//    }
//    
//    
//}


    
    
//    let vehicles: NSArray = jsonDoc as! NSArray
//    
//    
//    for i in 0..<vehicles.count {
//    if let dict = vehicles[i] as? NSDictionary {
//    
//    
//    
//    let dictKey = dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int ?? -1
//    
//    if dictKey != -1 {
//    
//    if var vehiclesData = vehiclesData as VehiclesDataProtocol! {
//    
//    var vehicle : Vehicle
//    
//    let vehicleX = vehiclesData.vehiclesDict[dictKey]
//    
//    
//    if vehicleX != nil {
//    
//    vehicle = vehicleX!
//    } else {
//    vehicle = Vehicle()
//    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
//    
//    
//    }
//    
//    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))
//    addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
//    addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
//    addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
//    addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))
//    
//    vehiclesData.vehiclesDict[vehicle.vehicleId] = vehicle
//    
//    
//    }
//    
//    }
//    
//    
//    }
//    
//    
//    
//    }
//    
//    
//    
//}
//
//
//}
//





//}

