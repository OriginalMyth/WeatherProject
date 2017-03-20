//
//  WeatherTableViewController.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, UITextFieldDelegate {

    
    let weatherDataHandler = WeatherData.sharedInstance
    let jsonHelper = JsonHelper()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        headerView.backgroundColor = UIColor.cyan
        
        let textfield = UITextField(frame: headerView.frame)
        textfield.placeholder = "Enter place name"
        textfield.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 10))
        textfield.leftViewMode = .always
        textfield.delegate = self
        
        headerView.addSubview(textfield)
        
        return headerView
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(textField.text!)
        getWeatherForecast(placeName: textField.text!)
        
        textField.text = ""
        
        return textField.resignFirstResponder()
    }
    
    
    private func getWeatherForecast(placeName :String) {
        
        let weatherResultsClosure : HttpConnect.weatherDataFromURL = {
            
            if let data = $1 {
                
                do {
                    
                    try self.jsonHelper.parseJson(jsonString: String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, weatherData : self.weatherDataHandler)

                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }
        }

        
        let aConnect = HttpConnect()
        aConnect.sendGetRequest(urlString: Constants.FIVEDAYWEATHERURLSTRING, weatherResultsClosure)
        
        
        
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.weatherDataHandler.weatherArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let weather = self.weatherDataHandler.weatherArray[indexPath.row]
         print("in cell main is... \(weather.mainDescription)")
        cell.textLabel?.text = weather.mainDescription

        
        cell.detailTextLabel?.text = String(format:"%.1f", weather.tempDay!)
        
        
        
        weather.fetchIconImage(imageID: weather.iconId!) { (image) -> Void in
            
            print("in cell image")
            
            cell.imageView?.image = image
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        

        
        
        
        return cell
    }



}
