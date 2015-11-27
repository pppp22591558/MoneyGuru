//
//  InvestmentPageViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var investments:[[String:AnyObject]] = []
    var createdViewControllers: [InvestmentViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        
        //MARK: HARD-CODED VALUES
        
        investments.append([
            "imageName": "Condo1.png",
            "risk": 0.5,
            "earningRate": 0.3
        ])
        
        investments.append([
            "imageName": "FoodBuilding2.png",
            "risk": 0.1,
            "earningRate": 0.25
        ])
        
        investments.append([
            "imageName": "Hotel.png",
            "risk": 0.34,
            "earningRate": 3.5
        ])
        
        
        for investment in investments {
            let currentInvestmentViewController = InvestmentViewController()
            
            currentInvestmentViewController.imageName = investment["imageName"] as? String
            currentInvestmentViewController.risk = investment["risk"] as? Float
            currentInvestmentViewController.earningRate = investment["earningRate"] as? Float
            
            createdViewControllers.append(currentInvestmentViewController)
        }
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
