//
//  InvestmentTableViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/28/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentTableViewController: UITableViewController {

    
    let possibleInvestments = [
        [
            "imageName": "Condo1",
            "earningRate": 0.3,
            "riskRate": 0.05,
            "level": 2,
            "name": "Lovely Estate"
        ],
        [
            "imageName": "Condo2",
            "earningRate": 0.35,
            "riskRate": 0.1,
            "level": 1,
            "name": "Great House"
        ],
        [
            "imageName": "FoodBuilding1",
            "earningRate": 0.15,
            "riskRate": 0.03,
            "level": 1,
            "name": "Hot Dog Stand"
        ],
        [
            "imageName": "FoodBuilding2",
            "earningRate": 0.2,
            "riskRate": 0.05,
            "level": 2,
            "name": "Bistro"
        ],
        [
            "imageName": "FoodBuilding3",
            "earningRate": 0.3,
            "riskRate": 0.08,
            "level": 3,
            "name": "Au Restaurant"
        ],
        [
            "imageName": "House1",
            "earningRate": 0.02,
            "riskRate": 0.01,
            "level": 1,
            "name": "Good Ole Home"
        ],
        [
            "imageName": "House2",
            "earningRate": 0.05,
            "riskRate": 0.02,
            "level": 2,
            "name": "Dad's House"
        ],
        [
            "imageName": "Apartment1",
            "earningRate": 0.05,
            "riskRate": 0.1,
            "level": 1,
            "name": "My First Flat"
        ],
        [
            "imageName": "Apartment2",
            "earningRate": 0.1,
            "riskRate": 0.15,
            "level": 2,
            "name": "City Style"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let propertyCell = tableView.dequeueReusableCellWithIdentifier("investment") as! InvestmentTableViewCell
        
        let investmentInfo = self.possibleInvestments[indexPath.row]
        propertyCell.info = investmentInfo
        propertyCell.setup()
        
        return propertyCell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return possibleInvestments.count
    }
override     
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
}
