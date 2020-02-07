//
//  TableViewDelegats+CountryListView.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
import UIKit
extension CountryListViewController: UITableViewDelegate,UITableViewDataSource{
    //#MARK:Tableview delegate and Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryArray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CountryTableViewCell = self.countryTableView.dequeueReusableCell(withIdentifier: tableViewIdentifire, for: indexPath) as! CountryTableViewCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.name.text = self.countryArray[indexPath.row].name
        cell.code.text = self.countryArray[indexPath.row].code
        if self.countryArray[indexPath.row].phoneCode == "-"{
           cell.phoneNumber.text = "N/A"
        }else{
        cell.phoneNumber.text = "+\(String(describing: self.countryArray[indexPath.row].phoneCode!))"
        }
        cell.flagImage.contentMode = .scaleAspectFill
        cell.flagImage.clipsToBounds = true
        if let checkedUrl = URL(string: "https:www.countryflags.io/\(self.countryArray[indexPath.row].code!)/flat/64.png"){
                    cell.activityIndicator.startAnimating()
         
                    print(checkedUrl)
                    ImageService.getImage(withURL: checkedUrl) { image in
        
        
                        if(image == nil){
                            print(checkedUrl)
                            print("image nil yetey")
                            cell.flagImage.image = UIImage(named: "mindBody")
                        }else{
                            print(checkedUrl)
                            print("Image Aali")
                            cell.flagImage.image = image
        
                        }
                        cell.activityIndicator.stopAnimating()
                        cell.activityIndicator.hidesWhenStopped = true
        
        
                    }
                }
 
 
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let provienceStoryBoard  = UIStoryboard(name: "Main", bundle: nil)
        let ProvienceVc  = provienceStoryBoard.instantiateViewController(withIdentifier: "ProvienceVc") as! ProvincesViewController
        ProvienceVc.countryId = (self.countryArray[indexPath.row].id)!
        ProvienceVc.countryName = (self.countryArray[indexPath.row].name)!
        self.navigationController?.pushViewController(ProvienceVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}
