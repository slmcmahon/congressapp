//
//  MemberModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/3/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Member : BaseModel {
    
    init(data : JSON) {
        super.init(json: data)
    }
    
    public var party : String {
        get { return jsonData["party"].stringValue }
    }
    
    public var fullName : String {
        get { return jsonData["person"]["name"].stringValue }
    }
    
    public var memberId : Int {
        get { return jsonData["person"]["id"].intValue }
    }
    
    public static func load(memberData : [JSON]!) -> [Member]! {
        return memberData.map { Member(data: $0) }
    }
}