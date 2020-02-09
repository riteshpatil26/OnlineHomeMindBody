//
//  CountryListViewController.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/5/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController,RetryButtonDelegate,UISearchBarDelegate {
    //#MARK:IBOutlets and Actions
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var logoimage: UIImageView!
    let searchController = UISearchController(searchResultsController: nil)
   //#MARK:Local Variables
    public var tableViewIdentifire : String = "countryCell"
    public var countryArray : Array<CountryList> = Array<CountryList>()
    let objeOverlay = LoadingOverlay()
    public let refreshControl = UIRefreshControl()
    var searchArray:Array<CountryList> = Array<CountryList>()
    //#MARK:Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = kTABLEVIEW_SEPARATOR_COLOR_WITH_ALPHA
        self.title = "COUNTRY LISTS"
        let nipName=UINib(nibName:"CountryTableViewCell", bundle:nil)
        self.countryTableView.register(nipName, forCellReuseIdentifier:tableViewIdentifire)
        self.countryTableView.separatorColor = kTABLEVIEW_SEPARATOR_COLOR
        self.countryTableView.alpha = 0
        retryDelegate = self
        addSearchBarController()
        if #available(iOS 10.0, *) {
            countryTableView.refreshControl = refreshControl
        } else {
            countryTableView.addSubview(refreshControl)
        }
        /* Added Pull to refresh Code */
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        refreshControl.tintColor = kTABLEVIEW_SEPARATOR_COLOR
        /*
         This will fade out logo and hit API Call and get result
        */
        UIView.animate(withDuration: 1.0, animations: {
            self.logoimage.alpha = 0
        })
        { (Bool) in
            self.callCountryListApi()
        }
    }
    /* This Methods Calls when Pull to Refresh of TableView */
    @objc private func refreshWeatherData(_ sender: Any) {
        callCountryListApi()
    }
    /*
     This Methods Fetch the Country List from the api
     */
    public func callCountryListApi(){
        self.objeOverlay.showOverlay(view: self.view)
        if Network.iSConnectedToNetwork(){
            self.getCountryLists()
        }else{
            self.objeOverlay.hideOverlayView()
            AlertView.instance.showAlert(title: "Failure", message: "No Internet connection.", alertType: .failure)
        }
        
    }
    /*
     Implement Retry Delegate Methods */
    func retryButton(){
        callCountryListApi()
    }
}
/* Search Functionalities  */
extension CountryListViewController: UISearchResultsUpdating {
    func addSearchBarController(){
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        countryTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = kTABLEVIEW_SEPARATOR_COLOR_WITH_ALPHA
    }
    func updateSearchResults(for searchController: UISearchController) {
        filterCountries(for: searchController.searchBar.text ?? "")
    }
    func filterCountries(for searchText: String){
        searchArray = countryArray.filter { country in
            return country.name.lowercased().contains(searchText.lowercased())
        }
        countryTableView.reloadData()
    }
}
