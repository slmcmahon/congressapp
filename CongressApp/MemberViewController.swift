//
//  MemberViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import SwiftyJSON

class MemberViewController : UIViewController {
    
    @IBOutlet var lblMemberName: UILabel!
    @IBOutlet var lblMemberPhone: UILabel!
    @IBOutlet var lblMemberTitle: UILabel!
    @IBOutlet var lblParty: UILabel!
    
    var vm : MemberViewModel?
    var memberId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm = MemberViewModel(memberId: memberId, onComplete: memberLoaded, onError: memberLoadFailed)
        
    }
    
    private func memberLoaded() {
        self.title = vm?.name
        lblMemberName.text = vm?.name
        lblMemberPhone.text = vm?.phone
        lblMemberTitle.text = vm?.title
        lblParty.text = vm?.party
    }
    
    private func memberLoadFailed(message : String!) {
        print("\(message)")
    }
}

