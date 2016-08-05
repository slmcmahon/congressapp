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
    
    public var coSponsors : [(String, Int)] {
        get {
            if let cs = jsonData["cosponsors"].array {
                return cs.map { ($0["name"].stringValue, $0["id"].intValue) }
            }
            return []
        }
    }
}