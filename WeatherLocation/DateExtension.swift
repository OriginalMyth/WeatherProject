//
//  DateExtension.swift
//  WeatherLocation
//
//  Created by TAE on 19/03/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation

extension Date {
    
        func dayOfTheWeek() -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: self)
        }
    
    
}
