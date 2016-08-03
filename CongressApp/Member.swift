//
//  MemberModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/3/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Member {
    
    let firstName : String!
    let gender : String!
    let party : String!
    let memberId : Int!
    let fullName : String!
    
    init(data : JSON) {
        let p = data["person"]
        
        party = data["party"].stringValue
        firstName = p["firstname"].stringValue
        gender = p["gender"].stringValue
        memberId = p["id"].intValue
        fullName = p["name"].stringValue
    }
    
    public static func load(memberData : [JSON]!) -> [Member]! {
        return memberData.map { Member(data: $0) }
    }
}