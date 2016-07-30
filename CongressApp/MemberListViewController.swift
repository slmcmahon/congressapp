//
//  MemberListViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import SwiftyJSON

class MemberListViewController : UITableViewController {
    
    var vm : MemberListViewModel?
    var stateCode : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 50, 0);
        
        vm = MemberListViewModel(stateCode: stateCode, onComplete: membersLoaded, onError: memberLoadFailed)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        
        cell.textLabel?.text = vm?[indexPath.row]!["person"]["name"].stringValue
        
        return cell as UITableViewCell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func membersLoaded() {
        self.tableView.reloadData()
    }
    
    func memberLoadFailed(message : String!) {
        print("Error: \(message)")
    }
    
}