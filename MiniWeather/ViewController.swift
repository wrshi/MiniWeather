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
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var currentWeatherSummaryLabel: UILabel?
    @IBOutlet weak var refreshIndicator: UIActivityIndicatorView?
    @IBOutlet weak var refreshButton: UIButton?
    
    private var forecasetAPIKey = "f39f20bdd77fd8248519dc16198cce41"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.423)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        retriveWeatherForecast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retriveWeatherForecast() {
        let forecastService = SWRForecastService(APIKey: forecasetAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long){
            (let currently) in
            if let currentWeather = currently {
                // update UI
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    if  let precipProbability = currentWeather.precipProbability {
                        self.currentPrecipitationLabel?.text = "\(precipProbability)%"
                    }
                    
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    
                    if let summary = currentWeather.summary {
                        self.currentWeatherSummaryLabel?.text = summary
                    }
                    self.toggleRefreshAnimation(false)
                })
                
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    
    @IBAction func refreshWeather(sender: AnyObject) {
        retriveWeatherForecast()
        toggleRefreshAnimation(true)
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton?.hidden = on
        if on {
            refreshIndicator?.startAnimating()
        }
        else {
            refreshIndicator?.stopAnimating()
        }
    }
    


}


