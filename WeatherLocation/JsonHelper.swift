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
                
                
                if let dictKey = weatherObject.object(forKey: "pressure") as? Int {
                    
                    print("**** pressure is \(dictKey)")
                    
                }
                
                if let dictObjectKey = weatherObject.object(forKey: "temp") as? AnyObject {//Is an jsonObject
                    
                    //print("**** pressure is \(dictKey)")
                    
                    if let dictKey = dictObjectKey.object(forKey: "day") as? Int {
                        
                       // print("**** day temp is \(dictKey)")
                        
                    }
                    
                    if let dictKey = dictObjectKey.object(forKey: "min") as? Int {
                        
                       // print("**** min temp is \(dictKey)")
                        
                    }
                    
                    if let dictKey = dictObjectKey.object(forKey: "max") as? Int {
                        
                        //print("**** max temp is \(dictKey)")
                        
                    }
                    if let dictKey = dictObjectKey.object(forKey: "eve") as? Int {
                        
                       // print("**** eve temp is \(dictKey)")
                        
                    }
                    
                    if let dictKey = dictObjectKey.object(forKey: "morn") as? Int {
                        
                        //print("**** morn temp is \(dictKey)")
                        
                    }
                    
                }
                
                if let innerWeatherArray = weatherObject.object(forKey: "weather") as? NSArray {//Is an jsonArray contains a JsonObject
                    
                    //Only gets the first **Priority** value
                    if let innerWeatherObject = innerWeatherArray.object(at: 0) as? AnyObject {
               
                        
                        if let dictKey = innerWeatherObject.object(forKey: "main") as? String {
                            
                            print("**** main weather is \(dictKey)")
                            
                        }
                        
                        if let dictKey = innerWeatherObject.object(forKey: "description") as? String {
                            
                            print("**** main weather is \(dictKey)")
                            
                        }
                        
                        if let dictKey = innerWeatherObject.object(forKey: "icon") as? String {
                            
                            print("**** main weather is \(dictKey)")
                            
                        }
                        
                    }
                    
                }
                
                if let dictKey = weatherObject.object(forKey: "speed") as? Int {
                    
                    //print("**** pressure is \(dictKey)")
                    
                }
                
                if let dictKey = weatherObject.object(forKey: "deg") as? Int {
                    
                    //print("**** pressure is \(dictKey)")
                    
                }
                
                if let dictKey = weatherObject.object(forKey: "clouds") as? Int {
                    
                    //print("**** pressure is \(dictKey)")
                    
                }
                
                if let dictKey = weatherObject.object(forKey: "rain") as? Int {
                    
                    //print("**** pressure is \(dictKey)")
                    
                }
                
                
                
                
                
               // addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))
                //    addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
                //    addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
                //    addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
                //    addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))
                //
                //    vehiclesData.vehiclesDict[vehicle.vehicleId] = vehicle
                
                
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

