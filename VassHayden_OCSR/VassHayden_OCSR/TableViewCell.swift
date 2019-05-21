//
//  TableViewCell.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/21/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var spotNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
