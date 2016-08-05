//
//  MemberRole.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/4/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MemberRole : BaseModel {
    
    init(data : JSON) {
        super.init(json: data)
    }
    
    public var roleId : Int {
        get { return jsonData["id"].intValue }
    }
    
    public var startDate : NSDate {
        get { return getOptionalDate("startdate")! }
    }
    
    public var endDate : NSDate {
        get { return getOptionalDate("enddate")! }
    }
    
    public var state : String {
        get { return jsonData["state"].stringValue }
    }
    
    public var address : String? {
        get {
            return hasExtra() ? jsonData["extra"]["addresss"].stringValue : nil
        }
    }
    
    public var phone : String {
        get { return jsonData["phone"].stringValue }
    }
    
    public var roleDisplay : String {
        get { return jsonData["role_type_label"].stringValue }
    }
    
    public var party : String {
        get { return jsonData["party"].stringValue }
    }
    
    public func hasExtra() -> Bool {
        return jsonData["extra"].exists()
    }
    
    public var leadershipTitle : String {
        get { return jsonData["leadership_title"].stringValue }
    }
    
    public var current : Bool {
        get { return jsonData["current"].boolValue }
    }
    
    public var congressNumbers : [Int] {
        get { return jsonData["congress_numbers"].arrayValue.map { $0.intValue } }
    }
    
    public var description : String {
        get { return jsonData["description"].stringValue }
    }
    
    public var roleType : String {
        get { return jsonData["role_type"].stringValue }
    }
    
    public var senatorClass : String {
        get { return jsonData["senator_class"].stringValue }
    }
    
    public var senatorClassDisplay : String {
        get { return jsonData["senator_class_label"].stringValue }
    }
    
    public var senatorRank : String {
        get { return jsonData["senator_rank"].stringValue }
    }
    
    public var senatorRankDisplay : String {
        get { return jsonData["senator_rank_label"].stringValue }
    }
    
    public var title : String {
        get { return jsonData["title"].stringValue }
    }
    
    public var titleDisplay : String {
        get { return jsonData["title_long"].stringValue }
    }
    
    public var webSite : String {
        get { return jsonData["website"].stringValue }
    }
    
    public var contactForm : String? {
        get { return hasExtra() ? jsonData["extra"]["contact_form"].stringValue : nil }
    }
    
    public var fax : String? {
        get { return hasExtra() ? jsonData["extra"]["fax"].stringValue : nil }
    }
    
    public var office : String? {
        get { return hasExtra() ? jsonData["extra"]["office"].stringValue : nil }
    }
    
    public var rssUrl : String? {
        get { return hasExtra() ? jsonData["extra"]["rss_url"].stringValue : nil }
    }
    
    public var stateName : String {
        get {
            return Constants.states.filter({ $0.1 == state }).first!.0
        }
    }
}