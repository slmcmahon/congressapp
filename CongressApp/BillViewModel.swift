//
//  BillViewModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation

public class BillViewModel : BaseViewModel {
    
    public var bill : BillDetail?
    
    public init(billId : Int!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        super.init()
        let url = "\(Constants.baseUrl)bill/\(billId)&fields=title,date_introduced,bill_resolution_type,bill_type,bill_type_label,congress,is_alive,is_current,link,number,related_bills"
        getData(url, onComplete: {
            self.loadData()
            onComplete()
        }, onError: onError)
    }
    
    private func loadData() {
        self.bill = BillDetail(data:super.jsonData)
    }
}