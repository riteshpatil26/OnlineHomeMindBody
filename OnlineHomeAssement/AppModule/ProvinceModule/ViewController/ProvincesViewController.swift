//
//  ProvincesViewController.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class ProvincesViewController: UIViewController,RetryButtonDelegate {
    //#MARK:IBOutlet
    @IBOutlet weak var provienceTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    //#MARK:Local Variables
    var noDataLabel :UILabel = UILabel()
    public var provienceArray : Array<ProvinceList> = Array<ProvinceList>()
    let objeOverlay = LoadingOverlay()
    private let locationManager = LocationManager()
    public var countryId : Int = 0
    public var countryName :String = ""
    //#MARK:Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "PROVINCE LISTS"
        self.navigationController?.navigationBar.barTintColor = kTABLEVIEW_SEPARATOR_COLOR
        let nipName=UINib(nibName:"ProvienceTableViewList", bundle:nil)
        self.provienceTableView.register(nipName, forCellReuseIdentifier:"provienceCell")
        self.provienceTableView.separatorColor = kTABLEVIEW_SEPARATOR_COLOR
        self.provienceTableView.alpha = 0
        addBackButton()
        retryDelegate = self
        callProvienceList()
        setLocationAccordingToProvience(string: countryName, latitudeDelta: 50.0, longitudeDelta: 50.0)
    }
    /* Fetch the provience List
     */
    override func viewWillAppear(_ animated: Bool) {
        noDataLabel.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        noDataLabel.text = "No records Found.This Country has no Proviences"
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = .center
        noDataLabel.numberOfLines = 2
        noDataLabel.alpha = 0.0
        self.view.addSubview(noDataLabel)
    }
    //#MARK:Tableview delegate and Datasource Methods
    public func addBackButton(){
        let newBackButton = UIBarButtonItem(image: UIImage(named: "Back")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    @objc func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    func retryButton() {
        callProvienceList()
    }
    func callProvienceList(){
        self.objeOverlay.showOverlay(view: self.view)
        if Network.iSConnectedToNetwork(){
            self.getProvienceList(id: "\(countryId)")
        }else{
            AlertView.instance.showAlert(title: "Failure", message: "No Internet connection.", alertType: .failure)
        }
    }
    public func setLocationAccordingToProvience(string :String,latitudeDelta:Double,longitudeDelta:Double) {
        
        let locationName = string

        self.locationManager.getLocation(forPlaceCalled: locationName) { location in
            guard let location = location else { return }
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta))
            
            let address = [CNPostalAddressStreetKey: locationName]
            let place = MKPlacemark(coordinate: center, addressDictionary: address)
            self.mapView.addAnnotation(place)
            self.mapView.setRegion(region, animated: true)
        }
    }
}
