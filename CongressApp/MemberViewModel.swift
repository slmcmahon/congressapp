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
    
    var member : MemberDetail?
    
    public init(memberId : Int!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        Alamofire.request(.GET, "\(Constants.memberBaseUrl)/\(memberId)", parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    let json = JSON(rs)
                    self.member = MemberDetail(data: json)
                    onComplete()
                } else {
                    onError(message: "Failed to load member data.")
                }
        }
    }
}