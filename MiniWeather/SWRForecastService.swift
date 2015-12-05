//
//  SWRForecastService.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-05.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import Foundation

struct SWRForecastService {
    
    let forecastAPIKey: String
    let forecastBaseUrl: NSURL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseUrl = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (SWRCurrentWeather? -> Void)){
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseUrl){
            let networkOperation = SWRNetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL(){
                (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
            }
        }
        else{
            println("Could not construct a valid URL")
        }
    }
    
    func currentWeatherFromJSON(JSONDictionary: [String: AnyObject]?) -> SWRCurrentWeather? {
        if let currentWeatherDictionary = JSONDictionary?["currently"] as? [String: AnyObject]{
            return SWRCurrentWeather(weatherDictionary: currentWeatherDictionary)
        }
        else{
            println("KSON dictionary returned nil for 'currently' key")
            return nil
        }
    }
}













