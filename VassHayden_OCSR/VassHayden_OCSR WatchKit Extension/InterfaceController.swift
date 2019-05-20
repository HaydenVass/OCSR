//
//  InterfaceController.swift
//  VassHayden_OCSR WatchKit Extension
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var swellCall: [SwellReport] = []

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    @IBAction func surfPressed() {
        configureURL(urlString: "http://api.spitcast.com/api/county/swell/orange-county/")
    }
    
    @IBAction func windsPressed() {
        configureWindURL(urlString: "http://api.spitcast.com/api/county/wind/orange-county/")
    }
    
    @IBAction func tidePressed() {
        print("pressed")

        
    }
    @IBAction func tempPressed() {
        configureTempURL(urlString: "http://api.spitcast.com/api/county/water-temperature/orange-county/")
    }
    
    func getCurrentHour() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        var str = formatter.string(from: Date())
        if str.prefix(1) == "0"{
            str = String(str.dropFirst(1))
        }
        return str
    }
    
    func getCurrentMinutes() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        var str = formatter.string(from: Date())
        str = String(str.dropLast(1))
        return str
    }
    
    
}
