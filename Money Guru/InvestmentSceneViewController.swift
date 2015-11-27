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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildingBackgroundView.layer.contents = UIImage(named: "SkyBuildingBackground.png")?.CGImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
