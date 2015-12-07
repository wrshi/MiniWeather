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
    
    func getForecast(lat: Double, long: Double, completion: (SWRForecast? -> Void)){
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseUrl){
            let networkOperation = SWRNetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL(){
                (let JSONDictionary) in
                let forecast = SWRForecast(weatherDictionary: JSONDictionary)
                completion(forecast)
            }
        }
        else{
            println("Could not construct a valid URL")
        }
    }
    

}













