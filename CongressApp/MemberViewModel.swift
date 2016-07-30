//
//  File.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class MemberViewModel {
    
    var name : String?
    var phone : String?
    var party : String?
    var title : String?
    var webSite : String?
    var twitterId : String?
    var youtubeId : String?
    
    public init(memberId : Int!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        Alamofire.request(.GET, "\(Constants.memberBaseUrl)/\(memberId)", parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    let json = JSON(rs)
                    self.loadData(json)
                    onComplete()
                } else {
                    onError(message: "Failed to load member data.")
                }
        }
    }
    
    private func loadData(data : JSON) {
        
        self.name = "\(data["lastname"].stringValue), \(data["firstname"].stringValue)"
        self.twitterId = data["twitterid"].stringValue
        self.youtubeId = data["youtubeid"].stringValue
        let roles = data["roles"].arrayValue.filter { $0["current"] == true }
        let role = roles.last;
        self.phone = role!["phone"].stringValue
        self.party = role!["party"].stringValue
        self.title = role!["role_type_label"].stringValue
        self.webSite = role!["website"].stringValue
        
    }
}