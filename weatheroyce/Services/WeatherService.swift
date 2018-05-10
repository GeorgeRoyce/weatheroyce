//
//  WeatherService.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class WeatherService {
    
    private let wundergroundKey = ""
    private let wundergroundScheme = "http"
    private let wundergroundHost = "api.wunderground.com"
    
    func getCurrentWeatherConditions(completion: () -> Void) {
        var components = URLComponents()
        components.scheme = wundergroundScheme
        components.host = wundergroundHost
        components.path = "/api/\(wundergroundKey)/conditions/q/42.3314,-83.0458.json"
        
        guard let url = components.url else {
            print("could not create url")
            return
        }
        
        NetworkManager.getDataFor(url) { (responseData) in
            do {
                let rawIntermediateConditions = try JSONDecoder().decode(RawIntermediateCurrentConditionsInfo.self, from: responseData)
                let rawCurrentConditions = rawIntermediateConditions.current_observation
                let currentConditions = CurrentWeatherConditions(rawCurrentConditions)
                print(currentConditions.degreesFahrenheit)
            } catch {
                print("error parsing data: \(error)")
            }
            
        }
    }
}

private struct RawIntermediateCurrentConditionsInfo: Decodable {
    
    let current_observation: RawCurrentWeatherConditions
    
}




