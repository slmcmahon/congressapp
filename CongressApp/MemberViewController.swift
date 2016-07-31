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
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblParty: UILabel!
    @IBOutlet var lblTwitterId : UILabel!
    @IBOutlet var lblYoutubeId : UILabel!
    @IBOutlet var lblWebSite : UILabel!
    
    var vm : MemberViewModel?
    var memberId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm = MemberViewModel(memberId: memberId, onComplete: memberLoaded, onError: memberLoadFailed)
    }
    
    private func memberLoaded() {
        self.title = vm?.name
        lblName.text = vm?.name
        lblPhone.text = vm?.phone
        lblTitle.text = vm?.title
        lblParty.text = vm?.party
        lblTwitterId.text = vm?.twitterId
        lblYoutubeId.text = vm?.youtubeId
        lblWebSite.text = vm?.webSite
    }
    
    private func memberLoadFailed(message : String!) {
        print("\(message)")
    }
}

