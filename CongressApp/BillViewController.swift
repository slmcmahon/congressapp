//
//  BillViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import PKHUD

class BillViewController : UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblCurrent: UILabel!
    @IBOutlet var lblAlive: UILabel!
    
    var vm : BillViewModel?
    var billId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HUD.show(.Progress)
        vm = BillViewModel(billId: billId, onComplete: billLoaded, onError: billLoadFailed)
    }
    
    private func billLoaded() {
        HUD.hide()
        
        lblTitle.text = vm?.bill?.title
        
        lblCurrent.text = vm!.bill!.isCurrent ? "Yes" : "No"
        lblAlive.text = vm!.bill!.isAlive ? "Yes" : "No"
    }
    
    private func billLoadFailed(message: String!) {
        print("\(message)")
    }
}