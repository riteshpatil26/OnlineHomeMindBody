//  
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/5/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

var SCREEN_WIDTH  = UIScreen.main.bounds.width
var SCREEN_HEIGHT  = UIScreen.main.bounds.height
var SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)

var IS_IPHONE_5 = (SCREEN_MAX_LENGTH == 568.0) ? true : false
var IS_IPHONE_6 =  (SCREEN_MAX_LENGTH == 667.0) ? true : false
var IS_IPHONE_6P =  (SCREEN_MAX_LENGTH == 736.0) ? true : false


///*************************** Extension for viewController *********************************

// MARK: Adjust UILabel font size according to device screen size Extention
extension UILabel {
    /// This method set Font size according to phone model
    ///
    /// - AppHelper.swift

    @IBInspectable var adjustFontSize: Bool{
        set {
            if newValue {
                let currentFont = self.font
                var sizeScale: CGFloat = 1
                
              
                if IS_IPHONE_5 {
                    sizeScale = 0.8
                }
                else if IS_IPHONE_6 {
                    sizeScale = 1.0
                }
                else if IS_IPHONE_6P {
                    sizeScale = 1.20
                }else{
                    sizeScale = 1.10
                }
                
                self.font = currentFont?.withSize((currentFont?.pointSize)! * sizeScale)
            }        }
        
        get {
            return false
        }
    }
    
    
    
}

extension UIButton {
    /// This method set Font size according to phone model
    ///
    /// - AppHelper.swift
    
    @IBInspectable var adjustFontSize: Bool{
        set {
            if newValue {
                let currentFont = self.titleLabel?.font
                var sizeScale: CGFloat = 1
                
              
               if IS_IPHONE_5 {
                    sizeScale = 0.8
                }
                else if IS_IPHONE_6 {
                    sizeScale = 1.0
                }
                else if IS_IPHONE_6P {
                    sizeScale = 1.20
                }else{
                    sizeScale = 1.10
                }
                
                self.titleLabel?.font = (currentFont?.withSize((currentFont?.pointSize)! * sizeScale))!
            }        }
        
        get {
            return false
        }
    }
    
   
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = true
        super.touchesBegan(touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = false
        super.touchesEnded(touches, with: event)
    }
    override open func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        self.isHighlighted = false
        super.touchesCancelled(touches!, with: event)
    }
    
    
}







