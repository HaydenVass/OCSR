//
//  getSpotForecastAsync.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/27/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import Foundation

extension ViewController{
    func configureSpotForecast(urlString: String){
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        if let validURL = URL (string: urlString){
            print (validURL)
            let task = session.dataTask(with: validURL) { (data, response, error) in
                if error != nil {return}
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else {return}
                do{
                    if let json = try JSONSerialization.jsonObject(with: data) as? [Any]
                    {
                        for data in json{
                            if let secondLevel = data as? [String: Any]{
                                let hour = secondLevel["hour"] as? String
                                let shape = secondLevel["shape"] as? String
                                print(hour ?? "na" + " " + shape!)

                            }
                        }
                    }
                }catch{
                    print ("Error: \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                 
                }
            }
            task.resume()
        }
    }
    
}
