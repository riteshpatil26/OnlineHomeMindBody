// LoadingOverlay.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 1/3/20.
//  Copyright © 2020 Transmit Security LTD. All rights reserved.
//

import UIKit
import Foundation


public class LoadingOverlay{
    
    var overlayView = UIView()
    var activityIndicatorMD:activityIndicator = activityIndicator()

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView!) {
        overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        activityIndicatorMD.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicatorMD.lineWidth = 3.0
        activityIndicatorMD.center = overlayView.center
        overlayView.addSubview(activityIndicatorMD)
        activityIndicatorMD.startLoading()
        self.overlayView.alpha = 0
        view.addSubview(overlayView)
        UIView.animate(withDuration: 0.5, animations: {
            
            self.overlayView.alpha = 1
        }) { (Bool) in
            
        }
}
    
    public func hideOverlayView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.overlayView.alpha = 0
        }) { (Bool) in
            self.activityIndicatorMD.completeLoading(success: true)
            self.overlayView.removeFromSuperview()
        }
    }
    
    
}
