//
//  ProvienceService.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
extension ProvincesViewController{
    /*This Method fetches the
    */
    func getProvienceList(id : String) {
        let APIUrl = NSURL(string:"\(BASE_URL)/worldregions/country/\(id)/province")
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.sessionSendsLaunchEvents = true
        sessionConfig.isDiscretionary = true
        sessionConfig.timeoutIntervalForResource = 20.0
        let defaultSession = URLSession(configuration: sessionConfig)
        let task = defaultSession.dataTask(with: APIUrl! as URL) { (data, response, error) in
            if data == nil {
                print("dataTaskWithRequest error: \(String(describing: error?.localizedDescription))")
            return
            }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data!, options: [])
                let arraylist  = jsonResponse as! Array<Dictionary<String,Any>>
                self.provienceArray.removeAll()
                for itmet in arraylist{
                    self.provienceArray.append(ProvinceList(dictData: itmet as Dictionary<String, AnyObject>))
                }
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.provienceTableView.dataSource = self
                        self.provienceTableView.delegate = self
                        self.provienceTableView.reloadData()
                        self.provienceTableView.alpha = 1
                        self.objeOverlay.hideOverlayView()
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
