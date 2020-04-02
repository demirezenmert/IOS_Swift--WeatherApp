//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mert Demirezen on 18.02.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Mark: IBOutlets
    
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var cityName: UITextField!
    
    //Mark: IBActions
   
    @IBAction func goToTodayWeather(_ sender: Any) {
            if cityName.text == ""{
                    let alert = UIAlertController(title: "Error", message: "Please Do Not Leave Empty", preferredStyle: .alert)
                
                    let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                    alert.addAction(button)
                    self.present(alert, animated: true, completion: nil)
                
            }else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TodayWeatherStoryBoardID") as! TodayWeatherTableViewController
                
                vc.cityName = self.cityName.text!
                
                self.show(vc, sender: nil)
                
                
                
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        showButton.layer.cornerRadius = 6
        showButton.layer.masksToBounds = true
        
        
    
        
    }
    
    
    
    
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

