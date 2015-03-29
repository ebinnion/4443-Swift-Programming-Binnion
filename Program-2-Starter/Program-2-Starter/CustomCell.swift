//
//  CustomCell.swift
//  Program-2-Starter
//
//  Created by Eric Binnion on 3/29/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
