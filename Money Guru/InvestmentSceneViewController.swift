//
//  InvestmentSceneViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentSceneViewController: UIViewController {
    
    @IBOutlet weak var buildingBackgroundView: UIView!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var buildingForegroundView: UIView!
    
    @IBOutlet weak var buildingContainerView: UIView!

    @IBOutlet weak var buildingRisk: UILabel!
    @IBOutlet weak var buildingLevel: UILabel!
    @IBOutlet weak var buildingName: UILabel!
    @IBOutlet weak var buildingReturnRate: UILabel!
    
    var level: String?
    var name: String?
    var returnRate: String?
    var risk: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildingBackgroundView.layer.contents = UIImage(named: "SkyBuildingBackground.png")?.CGImage
        
        collectButton.setImage(UIImage(contentsOfFile: "Collect Button Pressed.png"), forState: UIControlState.Highlighted)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateInvestmentInfo:", name: "investmentSwiped", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideInvestmentInfo:", name: "addPropertySwiped", object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showInvestmentInfo:", name: "addPropertyUnswiped", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateInvestmentInfo(notification: NSNotification) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        buildingLevel.text = String(notification.object!["level"]!!)
        buildingName.text = notification.object!["name"] as? String
        buildingRisk.text = appDelegate.parseFloatToPercent(notification.object!["risk"] as! Float)
        buildingReturnRate.text = appDelegate.parseFloatToPercent(notification.object!["earningRate"] as! Float)
    }
    
    func hideInvestmentInfo(notification: NSNotification) {
        buildingForegroundView.hidden = true
        collectButton.hidden = true
    }
    
    func showInvestmentInfo(notification: NSNotification) {
        buildingForegroundView.hidden = false
        collectButton.hidden = false
    }
}
