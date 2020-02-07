//
//  extension+ProvienceViewController.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
import UIKit

extension ProvincesViewController : UITableViewDelegate,UITableViewDataSource{
    //#MARK:TableView Cycles
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.provienceArray.count == 0{
            self.noDataLabel.alpha = 1
            self.mapView.alpha = 0
        }else{
            self.noDataLabel.alpha = 0
            self.mapView.alpha = 1
        }
        return self.provienceArray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ProvienceTableViewCell = self.provienceTableView.dequeueReusableCell(withIdentifier: "provienceCell", for: indexPath) as! ProvienceTableViewCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.name.text = self.provienceArray[indexPath.row].name
        cell.code.text = self.provienceArray[indexPath.row].code
        cell.countryCode.text = "\(String(describing: self.provienceArray[indexPath.row].countryCode!))"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let string = "\(self.provienceArray[indexPath.row].name!),\(countryName),"
        self.setLocationAccordingToProvience(string: string, latitudeDelta: 10.0, longitudeDelta: 10.0)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}
