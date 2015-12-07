//
//  SWRForecast.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-07.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import Foundation

struct SWRForecast {
    var currentWeather: SWRCurrentWeather?
    var weekly: [SWRDailyWeather] = []
    
    init(weatherDictionary: [String: AnyObject]?) {
        if let currentWeatherDictionary = weatherDictionary?["currently"] as? [String: AnyObject]{
            currentWeather = SWRCurrentWeather(weatherDictionary: currentWeatherDictionary)
        }
        if let weeklyWeatherArray = weatherDictionary?["daily"]?["data"] as? [[String: AnyObject]] {
            for dailyWeather in weeklyWeatherArray {
                let daily = SWRDailyWeather(dailyWeatherDict: dailyWeather)
                weekly.append(daily)
            }
        }
    }
}
