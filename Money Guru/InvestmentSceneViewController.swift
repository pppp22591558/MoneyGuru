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
    
    @IBOutlet weak var addPropertyContainerView: UIView!
    var level: String?
    var name: String?
    var returnRate: String?
    var risk: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let now = NSDate()
        let daytimeStart = now.dateAt(hours: 7, minutes: 0)
        let daytimeEnd = now.dateAt(hours:18, minutes: 30)
        
        if now >= daytimeStart && now <= daytimeEnd {
            buildingBackgroundView.layer.contents = UIImage(named: "Day BG")?.CGImage
            let animateClouds = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "addDayCloud:", userInfo: nil, repeats: true)
        } else {
            buildingBackgroundView.layer.contents = UIImage(named: "Night BG")?.CGImage
            let animateClouds = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "addNightCloud:", userInfo: nil, repeats: true)
        }
        
        collectButton.setImage(UIImage(contentsOfFile: "Collect Button Pressed.png"), forState: UIControlState.Highlighted)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateInvestmentInfo:", name: "investmentSwiped", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideInvestmentInfo:", name: "addPropertySwiped", object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showInvestmentInfo:", name: "addPropertyUnswiped", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addProperty:", name: "addPropertyTapped", object: nil)
        
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
    
    func addDayCloud(timer: NSTimer) {
        // MARK: cloud animation time
        
        if arc4random_uniform(4) != 1 {
            let randomCloud = UIImageView(image: UIImage(named: "Day Cloud " + String(arc4random_uniform(4))))
            let heightField = [Int(self.view.frame.maxY * 0.3), Int(self.view.frame.maxY * 0.65)]
            
            let randomY = CGFloat(arc4random_uniform(UInt32(heightField[1] - heightField[0]))) + CGFloat(heightField[0])
            randomCloud.contentMode = .ScaleAspectFit
            randomCloud.frame = CGRectMake(-101, randomY, 100, 100)
            self.view.insertSubview(randomCloud, aboveSubview: buildingBackgroundView)
            UIView.animateWithDuration(12.0, animations: {
                randomCloud.center.x += self.view.frame.width + 200 + 100
            })
        }
    }
    
    func addNightCloud(timer: NSTimer) {
        // MARK: cloud animation time
        
        if arc4random_uniform(4) != 1 {
            let randomCloud = UIImageView(image: UIImage(named: "Night Cloud " + String(arc4random_uniform(4))))
            let heightField = [Int(self.view.frame.maxY * 0.3), Int(self.view.frame.maxY * 0.5)]
            
            let randomY = CGFloat(arc4random_uniform(UInt32(heightField[1] - heightField[0]))) + CGFloat(heightField[0])
            randomCloud.contentMode = .ScaleAspectFit
            randomCloud.frame = CGRectMake(-101, randomY, 100, 100)
            self.view.insertSubview(randomCloud, aboveSubview: buildingBackgroundView)
            UIView.animateWithDuration(12.0, animations: {
                randomCloud.center.x += self.view.frame.width + 200 + 100
            })
        }
    }
    
    func addProperty(notification: NSNotification) {
        self.buildingContainerView.hidden = true
        self.addPropertyContainerView.hidden = false
    }
}
