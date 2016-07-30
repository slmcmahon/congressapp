//
//  FirstViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

class StatesViewController: UITableViewController {
    
    var stateNames : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 50, 0);
        
        stateNames = Array(Constants.states.keys).sort()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.states.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "StateCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        
        cell.textLabel?.text = stateNames[indexPath.row]
        
        return cell as UITableViewCell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showMembers", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let code = Constants.states[stateNames[indexPath.row]]
        let mlvc = segue.destinationViewController as! MemberListViewController
        mlvc.stateCode = code
    }

}

