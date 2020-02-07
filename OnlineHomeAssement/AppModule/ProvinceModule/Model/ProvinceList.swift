//
//  ProvinceList.swift
//  OnlineHomeAssement
//
//  Created by Ritesh Patil on 2/6/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class ProvinceList: NSObject {
    //MARK: Response Parser Variables-----------------
    var id:Int!
    var name:String!
    var code :String!
    var countryCode: String!
    
    init(obj : ProvinceList){
        self.id = obj.id
        self.name = obj.name
        self.code = obj.code
        self.countryCode = obj.countryCode
    }
    override init(){
        self.id = 227
        self.name = "UNITED STATES"
        self.code = "US"
        self.countryCode = "1"
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
        }
        if let top = dictData["CountryCode"] as? String{
            self.countryCode = top
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
        if let phoneCode = aDecoder.decodeObject(forKey: "CountryCode") as? String{
            self.countryCode = phoneCode
        }
    }
    func encode(with aCoder: NSCoder){
        aCoder.encode(id, forKey: "ID")
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(code, forKey: "Code")
        aCoder.encode(countryCode, forKey: "CountryCode")
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(id, forKey: "ID")
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(code, forKey: "Code")
        aCoder.encode(countryCode, forKey: "CountryCode")
    }
}
