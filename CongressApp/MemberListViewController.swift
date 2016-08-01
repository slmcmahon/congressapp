//
//  MemberListViewController.swift
//  CongressApp
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit
import SwiftyJSON
import PKHUD

class MemberListViewController : UITableViewController {
    
    var vm : MemberListViewModel?
    var stateData : (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = stateData!.1
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 50, 0);
        
        HUD.show(.Progress)
        vm = MemberListViewModel(stateCode: stateData!.0, onComplete: membersLoaded, onError: memberLoadFailed)
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
        
        let record = getRecord(indexPath.row)
        
        cell.textLabel?.text = record["person"]["name"].stringValue
        
        return cell as UITableViewCell!
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let record = getRecord(indexPath.row)
        let color = getColor(record)
        
        cell.contentView.backgroundColor = color
        cell.textLabel?.backgroundColor = UIColor.clearColor()
    }
    
    func getRecord(index : Int) -> JSON {
        return (vm?[index])!
    }
    
    // TODO: More colors, and obviously make it look nicer
    //   Independent: Purple
    //   Libertarian: Gold
    //   Vermont Progressive: Red
    //   Working Families: (white/blue/purple)
    //   Conservative Party of New York State: Orange
    //   Default:  clear
    func getColor(record : JSON) -> UIColor {
        return record["party"].stringValue == "Democrat"
            ? UIColor.init(colorLiteralRed: 0.0, green: 0.0, blue: 255.0, alpha: 0.5)
            : UIColor.init(colorLiteralRed: 255.0, green: 0.0, blue: 0.0, alpha: 0.5)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let code = vm?[indexPath.row]!["person"]["id"].intValue
        let mvc = segue.destinationViewController as! MemberViewController
        mvc.memberId = code
    }
    
    func membersLoaded() {
        HUD.hide()
        self.tableView.reloadData()
    }
    
    func memberLoadFailed(message : String!) {
        HUD.flash(.Error)
        print("Error: \(message)")
    }
    
}
