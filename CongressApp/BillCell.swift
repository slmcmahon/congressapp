//
//  BillCell.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/10/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

class BillCell : UITableViewCell {
    
    @IBOutlet var lblBillTitle : UILabel!
    @IBOutlet var lblActive : UILabel!
    @IBOutlet var lblAlive : UILabel!
    
    var bill : BillDetail!
    
    override func layoutSubviews() {
        lblBillTitle.text = bill.title
        lblActive.text = bill.isCurrent ? "Yes" : "No"
        lblAlive.text = bill.isAlive ? "Yes" : "No"
    }
}