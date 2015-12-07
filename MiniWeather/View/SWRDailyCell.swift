//
//  SWRDailyCell.swift
//  MiniWeather
//
//  Created by Weiran Shi on 2015-12-07.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

import UIKit

class SWRDailyCell: UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
