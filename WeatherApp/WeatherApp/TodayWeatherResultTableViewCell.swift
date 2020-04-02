//
//  TodayWeatherResultTableViewCell.swift
//  WeatherApp
//
//  Created by Mert Demirezen on 19.02.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import UIKit

class TodayWeatherResultTableViewCell: UITableViewCell {

    //Mark IBOutlets :
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultCelcius: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
