//
//  BaseModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/4/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class BaseModel {
    
    var jsonData : JSON
    
    init(json : JSON) {
        jsonData = json
    }
    
    func getStringValue(name: String) -> String {
        return jsonData[name].stringValue
    }
    
    func getIntValue(name: String) -> Int {
        return jsonData[name].intValue
    }
    
    func getOptionalString(name : String) -> String? {
        if let tmp = jsonData[name].string {
            return tmp
        }
        return nil
    }
    
    func getOptionalDate(name : String) -> NSDate? {
        if let tmp = jsonData[name].string {
            return getDate(tmp)
        }
        return nil
    }
    
    private func getDate(dstr : String!) -> NSDate {
        let fmt = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.dateFromString(dstr)!
    }
}