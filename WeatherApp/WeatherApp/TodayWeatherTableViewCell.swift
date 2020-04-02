//
//  TodayWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Mert Demirezen on 18.02.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import UIKit

class TodayWeatherTableViewCell: UITableViewCell {
    //Mark IBOutlets :
    
    @IBOutlet weak var selectedCity: UILabel!
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
