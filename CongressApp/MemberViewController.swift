//
//  MemberViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import SwiftyJSON
import PKHUD

class MemberViewController : UIViewController {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblParty: UILabel!
    @IBOutlet var lblYearsInOffice: UILabel!
    @IBOutlet var lblYearsInCurrentRole: UILabel!
    @IBOutlet var lblState: UILabel!
    
    var vm : MemberViewModel?
    var memberId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HUD.show(.Progress)
        vm = MemberViewModel(memberId: memberId, onComplete: memberLoaded, onError: memberLoadFailed)
    }
    
    private func memberLoaded() {
        HUD.hide()
        let mmbr = vm?.member;
        let cr = mmbr!.roles.last
        
        let fn = mmbr!.fullName
        self.title = fn
        
        lblName.text = fn
        lblPhone.text = cr!.phone
        lblTitle.text = cr!.roleDisplay
        lblParty.text = cr!.party
        lblState.text = cr!.stateName
        
        lblYearsInOffice.text = String(format: "%.1f", mmbr!.yearsInOffice)
        
        lblYearsInCurrentRole.text = String(format: "%.1f", mmbr!.getYearsInRole(cr!))
    }
    
    private func memberLoadFailed(message : String!) {
        print("\(message)")
    }
    
    private func isAppInstalled(prot: String!) -> Bool {
        return UIApplication.sharedApplication().canOpenURL(NSURL(string: "\(prot)://")!)
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        if (sender.tag == 0) {
            if isAppInstalled("twitter") {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitter://user?screen_name=\(vm?.member!.twitterId)")!)
            }
        }
    }
}

