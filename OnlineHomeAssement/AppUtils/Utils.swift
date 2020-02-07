//
//  Utils.swift
//  OnlineHomeAssement
//  Created by Ritesh Patil on 2/5/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.

import UIKit
import CoreFoundation

class Utils: NSObject {
   
    public func showToast(controller: UIViewController, message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true, completion: {
                
            })
        }
        
    }
   
  
  
}
