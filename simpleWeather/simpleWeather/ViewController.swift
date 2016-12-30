//
//  ViewController.swift
//  simpleWeather
//
//  Created by Doug Wells on 11/27/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var wxMessage: UILabel!
    @IBOutlet weak var cityName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cityNameSubmitted(_ sender: Any) {
        
        self.view.endEditing(true)
        let dashCity = cityName.text!.replacingOccurrences(of: " ", with: "%20")
        wxMessage.text = "Loading your weather Forecast ..."
        
        let wxWebsite = "http://www.weather-forecast.com/locations/" + dashCity + "/forecasts/latest"
        
        let wxAPI = "http://api.openweathermap.org/data/2.5/weather?q=" + dashCity + "&appid=094c7cfda5c9b5993192ea76c73f8d41"
            
        // getWeather(website: wxWebsite)
        getWxFromAPI(api: wxAPI)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /* func wxURL(town: NSString) -> String {
        let arr:[String] = town.uppercased.components(separatedBy: " ")
        
        dashCity = arr.joined(separator: "-")
        print("dashCity = ", dashCity)
        
        return dashCity
    }
    */
    
    func getWeather (website:String) {
        var weather: NSString = ""
        
        if let url = URL(string: website) {
            
            let request = NSMutableURLRequest(url:url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                
                if error != nil {
                    weather = "No Joy. See error logs"
                    
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        weather = (dataString!.components(separatedBy: "3 Day Weather Forecast: ")[1].components(separatedBy: "<span class=\"phrase\">")[1].components(separatedBy: "</")[0] as NSString)

                    }
                }
                print(weather)
                self.wxMessage.text = String(weather)
            }
            
            task.resume()
        }
        
    } //end getWeather function
    
    func getWxFromAPI(api: String) {
        
        let url = URL(string: api)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                
            }else {
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print("City name = ", jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            DispatchQueue.main.sync {
                                print("WX description = ", description)
                                self.wxMessage.text = "Today's Forecast: " + description
                            }

                        }
                        
                        print(jsonResult)
                        
                    } catch {
                        print("JSON Serialization failed")
                    }
                }
            }
        }
        task.resume()
    }


}

