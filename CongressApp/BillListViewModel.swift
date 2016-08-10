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
    
    public var billListItems : [BillDetail] = []
    
    public subscript(row : Int) -> BillDetail? {
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
        let url = "\(Constants.baseUrl)bill?sponsor=\(memberId)&fields=id,title,is_alive,is_current"
        getData(url, onComplete: {
            self.loadData()
            onComplete()
        }, onError: onError)
    }
    
    private func loadData() {
        if let objects = super.jsonData["objects"].array {
            billListItems = objects.map { BillDetail(data: $0) }
        }
    }
}
