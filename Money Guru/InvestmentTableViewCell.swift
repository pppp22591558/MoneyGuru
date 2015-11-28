//
//  InvestmentTableViewCell.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentTableViewCell: UITableViewCell {

    var info:[String:AnyObject]? = NSDictionary() as? [String : AnyObject]

    @IBOutlet weak var buildingName: UILabel!
    @IBOutlet weak var riskRate: UILabel!
    @IBOutlet weak var earningRate: UILabel!
    @IBOutlet weak var costToPurchase: UILabel!
    @IBOutlet weak var buildingImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        buildingImage.image = UIImage(named: info!["imageName"] as! String)
        buildingName.text = (info!["name"] as! String).uppercaseString
        riskRate.text = appDelegate.parseFloatToPercent(info!["riskRate"] as! Float)
        costToPurchase.text = "1500/ mo"
        earningRate.text = appDelegate.parseFloatToPercent(info!["earningRate"] as! Float)
        
        contentView.layer.borderColor = UIColor(red: 0.267, green: 0.133, blue: 0.44, alpha: 1.0).CGColor
        contentView.layer.borderWidth = 2.0
    }

}
