//
//  NetworkHandler.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/5/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
extension CountryListViewController{
    func getCountryLists() {
        let APIUrl = NSURL(string:"\(BASE_URL)/worldregions/country")
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.sessionSendsLaunchEvents = true
        sessionConfig.isDiscretionary = true
        sessionConfig.timeoutIntervalForResource = 20.0
        let defaultSession = URLSession(configuration: sessionConfig)
        let task = defaultSession.dataTask(with: APIUrl! as URL) { (data, response, error) in
            if data == nil {
                print("dataTaskWithRequest error: \(String(describing: error?.localizedDescription))")
                  self.objeOverlay.hideOverlayView()
                AlertView.instance.showAlert(title: "Failure", message: "\(error?.localizedDescription)", alertType: .failure)
                
                return
            }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data!, options: [])
                let arraylist  = jsonResponse as! Array<Dictionary<String,Any>>
                self.countryArray.removeAll()
                for itmet in arraylist{
                    self.countryArray.append(CountryList(dictData: itmet as Dictionary<String, AnyObject>))
                }
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.countryTableView.dataSource = self
                        self.countryTableView.delegate = self
                        self.countryTableView.reloadData()
                        self.countryTableView.alpha = 1
                        self.objeOverlay.hideOverlayView()
                        self.refreshControl.endRefreshing()
                    }
                }
            } catch let parsingError {
                AlertView.instance.showAlert(title: "Failure", message: "\(parsingError)", alertType: .failure)
                print("Error", parsingError)
            }
        }
        task.taskDescription = "CountryList"
        task.resume()
    }
}
