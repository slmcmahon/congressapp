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
    
    init(data : JSON) {
        super.init(json: data)
    }
    
    public var lastName : String {
        get { return jsonData["lastname"].stringValue }
    }
    
    public var firstName : String {
        get { return jsonData["firstname"].stringValue }
    }
    
    public var roles : [MemberRole] {
        get {
            return jsonData["roles"].arrayValue.map { MemberRole(data: $0) }
        }
    }
    
    public var bioGuideId : String {
        get { return jsonData["bioguidid"].stringValue }
    }
    
    public var birthday : NSDate? {
        get { return getOptionalDate("birthday") }
    }
    
    public var cspanId : Int {
        get { return jsonData["cspanid"].intValue }
    }
    
    public var gender : String {
        get { return jsonData["gender"].stringValue }
    }
    
    public var memberId : Int {
        get { return jsonData["id"].intValue }
    }
    
    public var url : String {
        get { return jsonData["link"].stringValue }
    }
    
    public var middleName : String? {
        get { return getOptionalString("middlename") }
    }
    
    public var name : String? {
        get { return jsonData["name"].stringValue }
    }
    
    public var nickName : String? {
        get { return getOptionalString("nickname") }
    }
    
    public var osId : String {
        get { return jsonData["osid"].stringValue }
    }
    
    public var pvsId : String {
        get { return jsonData["pvsid"].stringValue }
    }
    
    public var twitterId : String? {
        get { return getOptionalString("twitterid") }
    }
    
    public var youtubeId : String? {
        get { return getOptionalString("youtubeid") }
    }
    
    public var fullName : String! {
        get {
            return "\(self.lastName), \(self.firstName)"
        }
    }
    
    public var yearsInOffice : Float {
        get {
            return roles.map({ getYearsInRole($0) }).reduce(0, combine: {$0 + $1})
        }
    }
    
    public func getYearsInRole(role : MemberRole) -> Float {
        let months = NSCalendar.currentCalendar().components(.Month, fromDate: role.startDate, toDate: role.endDate, options: []).month
        return Float(months) / 12
    }
}