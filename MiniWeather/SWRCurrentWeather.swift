//
//  SWRCurrentWeather.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-03.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import Foundation

struct SWRCurrentWeather {
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]){
        temperature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        let precipProbabilityFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipProbabilityFloat * 100)
        summary = weatherDictionary["summary"] as! String
    }
}
