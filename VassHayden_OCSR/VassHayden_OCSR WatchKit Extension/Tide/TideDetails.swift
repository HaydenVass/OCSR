//
//  TideDetails.swift
//  VassHayden_OCSR WatchKit Extension
//
//  Created by Hayden Vass on 5/20/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit
import WatchKit

class TideDetails: WKInterfaceController {
    
    @IBOutlet var tideSizeLabel: WKInterfaceLabel!
    @IBOutlet var washLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let details = context as? (Double, Double){
            tideSizeLabel.setText("\(details.0))")
            washLabel.setText("\(details.1)")

            
        }
    }
}
