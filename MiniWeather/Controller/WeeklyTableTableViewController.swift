//
//  WeeklyTableTableViewController.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-06.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import UIKit

class WeeklyTableTableViewController: UITableViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    @IBOutlet weak var currentTemperatureRangeLabel: UILabel?
    
    private var forecasetAPIKey = "f39f20bdd77fd8248519dc16198cce41"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.423)
    
    var weeklyWeather: [SWRDailyWeather] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        retriveWeatherForecast()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        tableView.backgroundView = BackgroundView()
        
        if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0){
            let navBarAttributesDictionary: [NSObject: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: navBarFont
            ]
            navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.weeklyWeather.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell

        let dailyWeather = weeklyWeather[indexPath.row]
        cell.textLabel?.text = dailyWeather.day

        return cell
    }
    

    // MARK: - Weather Fetching
    
    func retriveWeatherForecast() {
        let forecastService = SWRForecastService(APIKey: forecasetAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long){
            (let forecast) in
            if let weatherForecast = forecast,
            let currentWeather = weatherForecast.currentWeather {
                // update UI
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    if  let precipProbability = currentWeather.precipProbability {
                        self.currentPrecipitationLabel?.text = "Rain: \(precipProbability)%"
                    }
                    
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    
                    self.weeklyWeather = weatherForecast.weekly
                    
                    if let highTemp = self.weeklyWeather.first?.maxTemperature,
                    let lowTemp = self.weeklyWeather.first?.minTemperature {
                        self.currentTemperatureRangeLabel?.text = "↑\(highTemp)º↓\(lowTemp)º"
                    }
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }


}
