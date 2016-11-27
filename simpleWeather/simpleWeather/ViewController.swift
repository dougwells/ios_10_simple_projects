//
//  ViewController.swift
//  simpleWeather
//
//  Created by Doug Wells on 11/27/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(grabSourceCode(website: "http://www.weather-forecast.com/locations/San-Diego/forecasts/latest"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func grabSourceCode (website:String) -> NSString {
        var message: NSString = ""
        
        if let url = URL(string: website) {
            
            let request = NSMutableURLRequest(url:url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                
                if error != nil {
                    message = "No Joy. See Logs"
                    
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        message = (dataString!.components(separatedBy: "3 Day Weather Forecast ")[1].components(separatedBy: "<span class=\"phrase\">")[1].components(separatedBy: "</")[0] as NSString)
                        print(message)
                    }
                }
            }
            
            task.resume()
        }
        return message
    }


}

