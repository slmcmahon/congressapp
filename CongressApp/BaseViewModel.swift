//
//  BaseViewModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class BaseViewModel {
    
    var jsonData : JSON
    
    init() {
        jsonData = nil
    }
    
    public func getData(urlString : String!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        Alamofire.request(.GET, urlString, parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    self.jsonData = JSON(rs)
                    onComplete()
                } else {
                    onError(message: "Failed to load data.")
                }
        }
    }
}