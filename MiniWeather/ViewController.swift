//
//  ViewController.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-03.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    private var forecasetAPIKey = "f39f20bdd77fd8248519dc16198cce41"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecasetAPIKey)")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // fetch data asynthonorously
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let request = NSURLRequest(URL: forecastURL!)
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
        })
        dataTask.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


