//
//  CurrentWeatherCondiditionsViewController.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import UIKit

class CurrentWeatherCondiditionsViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    var weatherService: WeatherService? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService = WeatherService()
        weatherService?.getCurrentWeatherConditions { currentConditions in
            DispatchQueue.main.async {
                self.updateUIFor(currentConditions)
            }
        }
    }
    
    private func updateUIFor(_ currentConditions: CurrentWeatherConditions) {
        self.currentTemperatureLabel.text = "\(currentConditions.degreesFahrenheit)º"
        self.currentLocationLabel.text = "Detroit, MI"
    }
}

