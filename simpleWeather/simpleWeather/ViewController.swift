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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cityNameSubmitted(_ sender: Any) {
        self.view.endEditing(true)
        wxMessage.text = "Loading your 3-Day Forecast ..."
        getWeather(website: "http://www.weather-forecast.com/locations/San-Diego/forecasts/latest")
        
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
                        weather = (dataString!.components(separatedBy: "3 Day Weather Forecast ")[1].components(separatedBy: "<span class=\"phrase\">")[1].components(separatedBy: "</")[0] as NSString)

                    }
                }
                print(weather)
                self.wxMessage.text = String(weather)
            }
            
            task.resume()
        }
    }


}

