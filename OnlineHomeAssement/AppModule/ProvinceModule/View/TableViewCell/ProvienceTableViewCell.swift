//
//  ProvienceTableViewCell.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class ProvienceTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var code: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
