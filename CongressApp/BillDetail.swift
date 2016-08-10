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
    
    public var title : String {
        get { return getStringValue("title") }
    }
    
    public var isAlive : Bool {
        get { return getBool("is_alive") }
    }
    
    public var isCurrent : Bool {
        get { return getBool("is_current") }
    }
}