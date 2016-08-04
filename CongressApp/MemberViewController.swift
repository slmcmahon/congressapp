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
    
    var vm : MemberViewModel?
    var memberId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HUD.show(.Progress)
        vm = MemberViewModel(memberId: memberId, onComplete: memberLoaded, onError: memberLoadFailed)
    }
    
    private func memberLoaded() {
        HUD.hide()
        self.title = vm?.member?.getFullName()
        lblName.text = vm?.member?.label
        lblPhone.text = vm?.member?.roles.last?.phone
        lblTitle.text = vm?.member?.roles.last?.title
        lblParty.text = vm?.member?.roles.last?.party
        
        
        let yio = vm?.member?.yearsInOffice()
        print (String(format: "%.1f years in office", yio!))
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

