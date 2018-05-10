//
//  NetworkManager.swift
//  weatheroyce
//
//  Created by George Royce on 5/10/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class NetworkManager {
    
    class func getDataFor(_ url: URL, completion: @escaping (Data) -> Void) {
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            //do something with the data
            guard error == nil else {
                print("error from Network Manager: \(String(describing: error))")
                return
            }
            
            guard let responseData = data else {
                print("did not have responseData")
                return
            }
            
            completion(responseData)
            
            }.resume()
        
    }
    
}
