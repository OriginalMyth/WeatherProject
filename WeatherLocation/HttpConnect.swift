//
//  HttpConnect.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class HttpConnect {
    
//    private func urlEncode(_ s: String) -> String {
//        return CFURLCreateStringByAddingPercentEscapes(nil, s as CFString!, nil,"!*'\"();:@&=+$,/?%#[]" as CFString!, CFStringBuiltInEncodings.UTF8.rawValue) as String
//    }
    
    
    public typealias weatherDataFromURL = (URLResponse?, Data?) -> Void
    
    public func sendGetRequest(urlString : String, _ handler: @escaping weatherDataFromURL) {
        
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        //let urlString = "http://api.openweathermap.org/data/2.5/forecast/daily?q=London,uk&cnt=5&units=metric&appid=ac328bb561a9a0600fbecb3e70ca96dc"
        
        if let encodeString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            
            let url = URL(string: encodeString) {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let urlSession = URLSession(configuration:sessionConfiguration, delegate: nil, delegateQueue: nil)
            
            let sessionTask = urlSession.dataTask(with: request) {
                (data, response, error) in
                handler(response, data)
            }
            
            
            sessionTask.resume()
            
        }
    }
    
    
}

