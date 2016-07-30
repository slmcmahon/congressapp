//
//  MemberListViewModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class MemberListViewModel {
    public var members : [JSON] = []
    
    public subscript(row : Int) -> JSON? {
        get {
            return members.count > 0 ? members[row] : nil
        }
        
        set {
            members[row] = newValue!
        }
    }
    
    public var count : Int {
        get {
            return members.count
        }
    }
    
    public init(stateCode : String!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        Alamofire.request(.GET, Constants.membersBaseUrl + "&state=" + stateCode, parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    let json = JSON(rs)
                    self.members = json["objects"].array!
                    onComplete()
                } else {
                    onError(message: "Failed to load member data.")
                }
        }
    }
}