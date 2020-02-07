//
//  CountryList.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/5/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class CountryList: NSObject,NSCoding {

    //MARK: Response Parser Variables-----------------
    var id:Int!
    var name:String!
    var code :String!
    var phoneCode : String!
    
    init(obj : CountryList){
        self.id = obj.id
        self.name = obj.name
        self.code = obj.code
        self.phoneCode = obj.phoneCode
    }
    override init(){
        self.id = 227
        self.name = "UNITED STATES"
        self.code = "US"
        self.phoneCode = "1"
        
    }
    init(dictData:Dictionary<String,AnyObject>){
        
        if let top = dictData["ID"] as? Int{
            self.id = top
        }
        if let top = dictData["Name"] as? String{
            self.name = top
        }
        if let top = dictData["Code"] as? String{
            self.code = top
        }else{
            self.code = "--"
        }
        if let top = dictData["PhoneCode"] as? String{
            self.phoneCode = top
        }else{
            self.phoneCode = "-"
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let id = aDecoder.decodeObject(forKey: "ID") as? Int{
            self.id = id
        }
        if let name = aDecoder.decodeObject(forKey: "Name") as? String{
            self.name = name
        }
        if let code = aDecoder.decodeObject(forKey: "Code") as? String {
            self.code = code
        }
        if let phoneCode = aDecoder.decodeObject(forKey: "PhoneCode") as? String{
            self.phoneCode = phoneCode
        }
        
    }
    func encode(with aCoder: NSCoder){
        aCoder.encode(id, forKey: "ID")
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(code, forKey: "Code")
        aCoder.encode(phoneCode, forKey: "PhoneCode")
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(id, forKey: "ID")
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(code, forKey: "Code")
        aCoder.encode(phoneCode, forKey: "PhoneCode")
    }
    
    
    
}
