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
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.423)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = SWRForecastService(APIKey: forecasetAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long){
            (let currently) in
            if let currentWeather = currently {
                // update UI
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let temperature = currentWeather.temperature{
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    if let humidity = currentWeather.humidity{
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    if  let precipProbability = currentWeather.precipProbability
                    {
                        self.currentPrecipitationLabel?.text = "\(precipProbability)%"
                    }
                })

            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


