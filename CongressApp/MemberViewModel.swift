//
//  File.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation

public class MemberViewModel : BaseViewModel {
    
    public var member : MemberDetail?
    
    public init(memberId : Int!, onComplete:() -> Void, onError:(message : String!) -> Void) {
        super.init()
        let url = "\(Constants.memberBaseUrl)/\(memberId)"
        getData(url, onComplete: {
            self.loadData()
            onComplete()
        }, onError: onError)
    }
    
    private func loadData() {
        self.member = MemberDetail(data:super.jsonData)
    }
}