//
//  BillListViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/5/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import PKHUD

class BillListViewController : UITableViewController {
    
    var vm : BillListViewModel?
    var memberId : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sponsored Bills"
        
        HUD.show(.Progress)
        
        vm = BillListViewModel(memberId: memberId, onComplete: billsLoaded, onError: billsLoadFailed)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 74.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "BillListCell"
        var cell: BillCell! = tableView.dequeueReusableCellWithIdentifier(cellId) as! BillCell!
        
        if (cell == nil) {
            cell = BillCell(style: .Default, reuseIdentifier: cellId)
        }
        
        
        cell.bill = vm?[indexPath.row]
        
        
        return cell
    }
    
    func billsLoaded() {
        HUD.hide()
        self.tableView.reloadData()
    }
    
    func billsLoadFailed(message: String!) {
        HUD.flash(.Error)
        print("Error: \(message)")
    }
}