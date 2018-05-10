//
//  CurrentWeatherCondiditions.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import UIKit

class CurrentWeatherCondiditions: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    var weatherService: WeatherService? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService = WeatherService()
        weatherService?.getCurrentWeatherConditions { currentConditions in
            DispatchQueue.main.async {
                self.currentTemperatureLabel.text = "\(currentConditions.degreesFahrenheit)º"                
            }
        }
    }
}

