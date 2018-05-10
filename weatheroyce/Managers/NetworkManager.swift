//
//  NetworkManager.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class NetworkManager {
    
    class func getDataFor(_ url: URL, completion: (Data) -> Void) {
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            //do something with the data
            guard error == nil else {
                print("error from Network Manager: \(error)")
                return
            }
            
            let json = String(data: data!, encoding: .utf8)
            print(json)
            
            }.resume()
        
    }
    
}
