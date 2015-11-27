//
//  InvestmentViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var imageName: String?
    var risk: Float?
    var earningRate: Float?
    var level: Int?
    var name: String?
    
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
            "imageName": "Condo3",
            "earningRate": 0.4,
            "riskRate": 0.15,
            "level": 3,
            "name": "Mansion"
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
        var midX = self.view.frame.midX
        let minY = self.view.frame.minY
        let width = self.view.frame.width
        let height = self.view.frame.height
        midX -= width * 0.5
        
        if name != "*Add a property" {
            let imageView = UIImageView(frame: CGRectMake(midX, minY + height*0.256, width, height*0.5))
            imageView.contentMode = .ScaleAspectFit
            
            imageView.image = UIImage(named: imageName!)
            self.view.addSubview(imageView)
        } else {
            let tractorImage = UIImageView(frame: CGRectMake(midX, minY + height*0.51, width, height*0.25))
            tractorImage.contentMode = .ScaleAspectFit
            
            tractorImage.image = UIImage(named: "Tractor")
            self.view.addSubview(tractorImage)
            
            let addPropertyButton = UIButton(frame: CGRectMake(midX, minY + height*0.4, width, height*0.1))
            addPropertyButton.setImage(UIImage(named: "Add Property"), forState: UIControlState.Normal)
            
            addPropertyButton.imageView!.contentMode = .ScaleAspectFit
            addPropertyButton.addTarget(self, action: "addProperty:", forControlEvents: UIControlEvents.TouchUpInside)
            
            self.view.addSubview(addPropertyButton)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addProperty(sender: UIButton) {
        let addPropertyTableView = UITableView(frame: CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.width, self.view.frame.height))
        addPropertyTableView.delegate = self
        addPropertyTableView.dataSource = self
        
        addPropertyTableView.registerClass(InvestmentTableViewCell.self, forCellReuseIdentifier: "investment")
        self.view.addSubview(addPropertyTableView)

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let propertyCell = tableView.dequeueReusableCellWithIdentifier("investment") as! InvestmentTableViewCell
        
        let investmentInfo = self.possibleInvestments[indexPath.row]
        propertyCell.info = investmentInfo
        
        return propertyCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return possibleInvestments.count
    }

}
