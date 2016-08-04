//
//  MemberDetail.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/4/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MemberDetail : BaseModel {
    let bioGuidId : String!
    let birthday : NSDate
    let cspanId : Int!
    let firstName : String!
    let gender : String!
    let memberId : Int!
    let lastName : String!
    let url : String!
    let middleName : String!
    let label : String!
    let nickName : String!
    let osId : String!
    let pvsId : String!
    let twitterId : String!
    let youTubeId : String!
    let roles : [MemberRole]
    
    init(data : JSON) {
        bioGuidId = data["bioguidid"].stringValue
        birthday = MemberDetail.getDate(data["birthday"].stringValue)
        cspanId = data["cspanid"].intValue
        firstName = data["firstname"].stringValue
        gender = data["gender"].stringValue
        memberId = data["id"].intValue
        lastName = data["lastname"].stringValue
        url = data["link"].stringValue
        middleName = data["middlename"].stringValue
        label = data["name"].stringValue
        nickName = data["nickname"].stringValue
        osId = data["osid"].stringValue
        pvsId = data["pvsid"].stringValue
        twitterId = data["twitterid"].string == nil ? "" : data["twitterId"].stringValue
        youTubeId = data["youtubeid"].string == nil ? "" : data["youtubeid"].stringValue
        roles = data["roles"].arrayValue.map { MemberRole(data: $0) }
    }
    
    public func getFullName() -> String! {
        return "\(self.lastName), \(self.firstName)"
    }
    
    public func yearsInOffice() -> Float {
        return roles.map({ getYearsInRole($0) }).reduce(0, combine: {$0 + $1})
    }
    
    private func getYearsInRole(role : MemberRole) -> Float {
        let months = NSCalendar.currentCalendar().components(.Month, fromDate: role.startDate, toDate: role.endDate, options: []).month
        return Float(months) / 12
    }
}