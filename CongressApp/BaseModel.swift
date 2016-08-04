//
//  BaseModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/4/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation

public class BaseModel {
    
    static func getDate(dstr : String!) -> NSDate {
        let fmt = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.dateFromString(dstr)!
    }
}