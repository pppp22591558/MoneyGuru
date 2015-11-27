//
//  InvestmentPageViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var investments:[[String:AnyObject]] = []
    var createdViewControllers: [InvestmentViewController] = []
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        //MARK: HARD-CODED VALUES
        
        investments.append([
            "imageName": "Condo1.png",
            "risk": 0.5,
            "earningRate": 0.3,
            "level": 1,
            "name": "LA House"
        ])
        
        investments.append([
            "imageName": "FoodBuilding2.png",
            "risk": 0.1,
            "earningRate": 0.25,
            "level": 2,
            "name": "Greasy Spoon"
        ])
        
        investments.append([
            "imageName": "Hotel.png",
            "risk": 0.34,
            "earningRate": 3.5,
            "level": 1,
            "name": "Grand Hotel"
        ])
        
        
        for investment in investments {
            let currentInvestmentViewController = InvestmentViewController()
            
            currentInvestmentViewController.imageName = investment["imageName"] as? String
            currentInvestmentViewController.risk = investment["risk"] as? Float
            currentInvestmentViewController.earningRate = investment["earningRate"] as? Float
            currentInvestmentViewController.level = investment["level"] as? Int
            currentInvestmentViewController.name = investment["name"] as? String
            
            createdViewControllers.append(currentInvestmentViewController)
        }
        
        
        createdViewControllers.append(InvestmentViewController())
        createdViewControllers.last!.name = "*Add a property"
        
        self.setViewControllers([createdViewControllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let length = createdViewControllers.count
        let currentIndex = createdViewControllers.indexOf(viewController as! InvestmentViewController)
        if currentIndex < length - 1 {
            
            return createdViewControllers[currentIndex! + 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = createdViewControllers.indexOf(viewController as! InvestmentViewController)
        if currentIndex > 0 {
            return createdViewControllers[currentIndex! - 1]
        } else {
            return nil
        }
    }

    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        let incomingInvestment = pendingViewControllers[0] as! InvestmentViewController
        if incomingInvestment.name != "*Add a property" {
            let dataToSend = [
                "level": incomingInvestment.level!,
                "name": incomingInvestment.name!,
                "risk": incomingInvestment.risk!,
                "earningRate": incomingInvestment.earningRate!
            ]
            NSNotificationCenter.defaultCenter().postNotificationName("investmentSwiped", object: dataToSend)
            
            if incomingInvestment == createdViewControllers[createdViewControllers.endIndex - 2] {
                NSNotificationCenter.defaultCenter().postNotificationName("addPropertyUnswiped", object: nil)
            }
            
        } else {
            
            NSNotificationCenter.defaultCenter().postNotificationName("addPropertySwiped", object: nil)
        }


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
