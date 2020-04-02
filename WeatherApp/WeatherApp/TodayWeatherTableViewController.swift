//
//  TodayWeatherTableViewController.swift
//  WeatherApp
//
//  Created by Mert Demirezen on 18.02.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import UIKit

class TodayWeatherTableViewController: UITableViewController {
    //MArk Variables;
    var cityName = ""
    var cityNameCell = ""
    var currentWeather = ""
    var currentWeatherNumber = ""
    var refreshAction = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        getTodayResult()
        //getToday2()
        refreshAction.addTarget(self, action: #selector(refreshNow), for: .valueChanged)
        refreshAction.tintColor = UIColor.blue
        self.tableView.addSubview(refreshAction)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayWeatherCell", for: indexPath) as! TodayWeatherTableViewCell
            cell.selectedCity.text = "Selected City: \(cityNameCell)"
            return cell
            
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayWeatherResultCell", for: indexPath) as! TodayWeatherResultTableViewCell
            
            cell.resultText.text = currentWeather
            cell.resultCelcius.text = "\(currentWeatherNumber)℃"
            return cell
        }
    }
    
    @objc func refreshNow () {
        cityName = "lublin"
        self.refreshAction.endRefreshing()
        getTodayResult()
        
    }
    
    
 
    func getTodayResult() {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=2fd059d1703c195e1ad530e8f1846dc9"){
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    if let incomingData = data{
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                           print(jsonResult)
                            let weather = jsonResult["weather"] as! NSArray
                            //print(weather)
                            
                            let weather1 = weather.firstObject as! [String : AnyObject]
                            if let description = weather1["description"] as? String {
                                print("Choosed of Weather : \(description)")
                                
                                DispatchQueue.main.sync(execute: {
                                    self.currentWeather = description
                                    
                                    self.tableView.reloadData()
                                })
                                
                            }
                            let cityReal = String( jsonResult["name"] as! NSString )
                            print(cityReal)
                            let weatherNumber = jsonResult["main"] as! NSDictionary
                            if let weatherNumber1 = weatherNumber["temp"] as? Double {
                                    print(weatherNumber1)
                                let a = Float(Double(weatherNumber1)-(274.15))
                                print(a)
                                DispatchQueue.main.sync(execute: {
                                    self.currentWeatherNumber = String(a)
                                    self.cityNameCell = cityReal
                                    
                                    self.tableView.reloadData()
                                })
                                
                            }
                            
                            
                            
                            
                        }catch {
                            print("Error Json Result....")
                            let alert = UIAlertController(title: "Error", message: "Json Result Has a Error", preferredStyle: UIAlertController.Style.alert)
                            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            alert.addAction(okButton)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                    
                }else {
                    
                    print("Error 404 - URL")
                    let alert = UIAlertController(title: "Error", message: "404-Url", preferredStyle: .alert)
                    let okButton  = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            task.resume()
            
            
            
        }
        
    }
 
    /*
    func getToday2 () {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=ankara&appid=2fd059d1703c195e1ad530e8f1846dc9"){
            
            let request = URLRequest(url: url)
            print(request)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    if let incomingData = data{
                        print(incomingData)
                    }
                    
                }else {
                    print("Error 404 -URL")
                }
            }
            task.resume()
            
            
        }
        
        
        
    }
    */
    
}
