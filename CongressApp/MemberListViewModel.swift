//
//  MemberListViewModel.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation

public class MemberListViewModel  : BaseViewModel {
    public var members : [Member] = []
    
    public subscript(row : Int) -> Member? {
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
    
    public init(stateCode : String, onComplete:() -> Void, onError:(message : String!) -> Void) {
        super.init()
        let url = Constants.membersBaseUrl + "&state=" + stateCode
        getData(url, onComplete: {
            self.loadData()
            onComplete()
        }, onError: onError)
    }
    
    private func loadData() {
        self.members = Member.load(super.jsonData["objects"].array!)
    }
}