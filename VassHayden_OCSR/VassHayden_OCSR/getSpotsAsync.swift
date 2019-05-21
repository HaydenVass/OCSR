//
//  apiCall.swift
//  VassHayden_OCSR WatchKit Extension
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import Foundation
//api call for swells


extension ViewController{
    func configureSpotUrl(urlString: String){
        
        var spotArray: [BeachSpot] = []
        
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
                        print(json)
                        for data in json{
                            if let secondLevel = data as? [String: Any]{
                                let name = secondLevel["spot_name"] as? String
                                let id = secondLevel["spot_id"] as? Int
                                spotArray.append(BeachSpot(_name: name ?? "na", _id: id ?? 1))
                            }
                        }
                    }
                }catch{
                    print ("Error: \(error.localizedDescription)")
                }
                // get back on the main thread - perform segue -
                //checks against most recent minute (by 10s) to present most relevant ata
                DispatchQueue.main.async {
                    //refresh table view
                }
            }
            task.resume()
        }
    }
    
}


