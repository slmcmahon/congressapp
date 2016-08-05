//
//  BillDetail.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class BillDetail : BaseModel {
    
    init(data : JSON) {
        super.init(json: data)
    }
    
    //&fields=title,date_introduced,bill_resolution_type,bill_type,bill_type_label,congress,is_alive,is_current,link,number,related_bills
    
    public var title : String {
        get { return getStringValue("title") }
    }
    
    public var dateIntroduced : NSDate {
        get { return getOptionalDate("date_introduced")! }
    }
    
    public var billResolutionType : String {
        get { return getStringValue("bill_resolution_type") }
    }
    
    public var billType : String {
        get { return getStringValue("bill_type") }
    }
    
    public var billTypeDisplay : String {
        get { return getStringValue("bill_type_label") }
    }
    
    public var congress : Int {
        get { return getIntValue("congress") }
    }
    
    public var isAlive : Bool {
        get { return getBool("is_alive") }
    }
    
    public var isCurrent : Bool {
        get { return getBool("is_current") }
    }
    
    public var url : String? {
        get { return getOptionalString("link") }
    }
    
    public var number : Int {
        get { return getIntValue("number") }
    }
    
    public var relatedBills : [Int] {
        get {
            if let related = jsonData["related_bills"].array {
                return related.map { $0["bill"].intValue }
            }
            return []
        }
    }
    
    public var coSponsors : [(String, Int)] {
        get {
            if let cs = jsonData["cosponsors"].array {
                return cs.map { ($0["name"].stringValue, $0["id"].intValue) }
            }
            return []
        }
    }
}