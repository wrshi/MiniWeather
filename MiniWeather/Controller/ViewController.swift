//
//  ViewController.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-03.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var sunriseLabel: UILabel?
    @IBOutlet weak var sunsetLabel: UILabel?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var lowTemperatureLabel: UILabel?
    @IBOutlet weak var highTemperatureLabel: UILabel?
    @IBOutlet weak var precipitationLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    
    
    var dailyWeather: SWRDailyWeather? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        if let weather = dailyWeather {
            self.title = weather.day
            weatherIcon?.image = weather.largeIcon
            summaryLabel?.text = weather.summary
            sunriseLabel?.text = weather.sunriseTime
            sunsetLabel?.text = weather.sunsetTime
            
            if let lowTemp = weather.minTemperature,
            let highTemp = weather.maxTemperature,
            let rain = weather.precipChance,
                let humidity = weather.humidity {
                    lowTemperatureLabel?.text = "\(lowTemp)º"
                    highTemperatureLabel?.text = "\(highTemp)º"
                    precipitationLabel?.text = "\(rain)%"
                    humidityLabel?.text = "\(humidity)%"
            }
        }
        
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 18.0){
            let barButtonAttributesDictionary: [NSObject: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: buttonFont
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, forState: .Normal)
        }
        
        // update UI
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    


}


