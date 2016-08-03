//
//  MemberCell.swift
//  CongressApp
//
//  Created by Stephen McMahon on 8/3/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

public class MemberCell : UITableViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var colorView: UIView!
    
    public var member : Member!
    
    override public func layoutSubviews() {
        lblName.text = member.fullName
        
        var color : UIColor!
        if let c = Constants.partyColors[member.party] {
            color = c
        } else {
            color = UIColor.clearColor()
        }
        colorView.backgroundColor = color
    }
}