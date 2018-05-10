//
//  CurrentWeatherConditions.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct CurrentWeatherConditions {
    
    let degreesFahrenheit: Int
    
    init(_ raw: RawCurrentWeatherConditions) {
        degreesFahrenheit = Int(raw.temp_f)
    }
    
}

struct RawCurrentWeatherConditions: Decodable {
    
    let temp_f: Float
    
}
