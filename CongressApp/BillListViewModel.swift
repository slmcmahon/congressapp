//
//  BillListViewModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class BillListViewModel : BaseViewModel {
    
    public var billListItems : [(String, Int)] = []
    
    public subscript(row : Int) -> (String, Int)? {
        get {
            return billListItems.count > 0 ? billListItems[row] : nil
        }
        
        set {
            billListItems[row] = newValue!
        }
    }
    
    public var count : Int {
        get {
            return billListItems.count
        }
    }
    
    public init(memberId : Int, onComplete:() -> Void, onError:(message : String!) -> Void) {
        super.init()
        let url = "\(Constants.baseUrl)bill?sponsor=\(memberId)&fields=display_number,id"
        getData(url, onComplete: {
            self.loadData()
            onComplete()
        }, onError: onError)
    }
    
    private func loadData() {
        if let objects = super.jsonData["objects"].array {
            billListItems = objects.map { ($0["display_number"].stringValue, $0["id"].intValue) }
        }
    }
}
