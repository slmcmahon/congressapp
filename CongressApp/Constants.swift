//
//  Constants.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

public struct Constants {
    static let baseUrl = "https://www.govtrack.us/api/v2/"
    static let membersBaseUrl = Constants.baseUrl + "role?current=true"
    static let memberBaseUrl = Constants.baseUrl + "person/"
    
    static let partyColors : Dictionary<String, UIColor> = [
        "Republican" : UIColor.redColor(),
        "Democrat" : UIColor.blueColor(),
        "Independent" : UIColor.purpleColor(),
        "Libertarian" : UIColor.init(colorLiteralRed: 207.0, green: 181.0, blue: 59.0, alpha: 1.0)
    ]
    
    static let states : Dictionary<String,String> = [
        "Alabama":"AL",
        "Alaska":"AK",
        "Arizona":"AZ",
        "Arkansas":"AR",
        "California":"CA",
        "Colorado":"CO",
        "Connecticut":"CT",
        "Delaware":"DE",
        "Florida":"FL",
        "Georgia":"GA",
        "Hawaii":"HI",
        "Idaho":"ID",
        "Illinois":"IL",
        "Indiana":"IN",
        "Iowa":"IA",
        "Kansas":"KS",
        "Kentucky":"KY",
        "Louisiana":"LA",
        "Maine":"ME",
        "Maryland":"MD",
        "Massachusetts":"MA",
        "Michigan":"MI",
        "Minnesota":"MN",
        "Mississippi":"MS",
        "Missouri":"MO",
        "Montana":"MT",
        "Nebraska":"NE",
        "Nevada":"NV",
        "New Hampshire":"NH",
        "New Jersey":"NJ",
        "New Mexico":"NM",
        "New York":"NY",
        "North Carolina":"NC",
        "North Dakota":"ND",
        "Ohio":"OH",
        "Oklahoma":"OK",
        "Oregon":"OR",
        "Pennsylvania":"PA",
        "Rhode Island":"RI",
        "South Carolina":"SC",
        "South Dakota":"SD",
        "Tennessee":"TN",
        "Texas":"TX",
        "Utah":"UT",
        "Vermont":"VT",
        "Virginia":"VA",
        "Washington":"WA",
        "West Virginia":"WV",
        "Wisconsin":"WI",
        "Wyoming":"WY",
        "District of Columbia":"DC",
        "American Samoa":"AS",
        "Guam":"GU",
        "Northern Mariana Islands":"MP",
        "Puerto Rico":"PR",
        "United States Minor Outlying Islands":"UM",
        "Virgin Islands":"VI"
    ]
}
