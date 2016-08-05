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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "BillListCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        
        let item = vm?[indexPath.row]
        
        cell.textLabel?.text = item!.0
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let billId = vm?[indexPath.row]!.1
        let mvc = segue.destinationViewController as! BillViewController
        mvc.billId = billId
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