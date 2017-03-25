//
//  WeatherTableViewController.swift
//  WeatherLocation
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, UITextFieldDelegate {

    
    
    
    @IBOutlet weak var UITitleNavItem: UINavigationItem!
    
    //var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    let weatherDataHandler = WeatherData.sharedInstance
    let jsonHelper = JsonHelper()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
                let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        view.addConstraint(verticalConstraint)
        
       // activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        //activityIndicator.color = .yellow
        activityIndicator.color = .cyan
        
        
        
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
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .default
//    }
    
    
    private func getWeatherForecast(placeName :String) {
        
       // activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        UITitleNavItem.title = "Weather For \(placeName)"
        weatherDataHandler.weatherArray.removeAll()
        
        let weatherResultsClosure : HttpConnect.weatherDataFromURL = {
            
            if let data = $1 {
                
                do {
                    
                    try self.jsonHelper.parseJson(jsonString: String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, weatherData : self.weatherDataHandler)

                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                       // self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                    }
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }
        }

        
        let forecastString = Constants.BASE_FORCECAST_STRING + placeName + Constants.END_FORECAST_STRING
        
        let aConnect = HttpConnect()
        //aConnect.sendGetRequest(urlString: Constants.FIVEDAYWEATHERURLSTRING, weatherResultsClosure)
        aConnect.sendGetRequest(urlString: forecastString, weatherResultsClosure)
        
        
        
        
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

            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
            
        }
        
        

        
        
        
        return cell
    }



}
