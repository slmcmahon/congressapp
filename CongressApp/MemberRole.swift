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
    let current : Bool
    let congressNumbers : [Int]
    let description : String
    let startDate : NSDate
    let endDate : NSDate
    let roleId : Int
    let leadershipTitle : String
    let party : String
    let phone : String
    let roleType : String
    let roleDisplay : String
    let senatorClass : String
    let senatorClassDisplay : String
    let senatorRank : String
    let senatorRankDisplay : String
    let state : String
    let title : String
    let titleDisplay : String
    let webSite : String
    let contactForm : String
    let address : String
    let hasExtra : Bool
    let fax : String
    let office : String
    let rssUrl : String
    
    init(data : JSON) {
        roleId = data["id"].intValue
        current = data["current"].boolValue
        congressNumbers = data["congress_numbers"].arrayValue.map { $0.intValue }
        description = data["description"].stringValue
        endDate = MemberRole.getDate(data["enddate"].stringValue)
        leadershipTitle = data["leadership_title"].stringValue
        party = data["party"].stringValue
        phone = data["phone"].stringValue
        roleType = data["role_type"].stringValue
        roleDisplay = data["role_type_label"].stringValue
        senatorClass = data["senator_class"].stringValue
        senatorClassDisplay = data["senator_class_label"].stringValue
        senatorRank = data["senator_rank"].stringValue
        senatorRankDisplay = data["senator_rank_label"].stringValue
        startDate = MemberRole.getDate(data["startdate"].stringValue)
        state = data["state"].stringValue
        title = data["title"].stringValue
        titleDisplay = data["title_long"].stringValue
        webSite = data["website"].stringValue
        hasExtra = data["extra"].exists()
        contactForm = data["extra"]["contact_form"].stringValue
        address = data["extra"]["address"].stringValue
        fax = data["extra"]["fax"].stringValue
        office = data["extra"]["office"].stringValue
        rssUrl = data["extra"]["rss_url"].stringValue
    }
    
}