//
//  InvestmentViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController {

    var imageName: String?
    var risk: Float?
    var earningRate: Float?
    var level: Int?
    var name: String?

    

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
        /*let addPropertyTableView = UITableView(frame: CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.width * 0.9, self.view.frame.height * 0.9))
        addPropertyTableView.delegate = self
        addPropertyTableView.dataSource = self
        
        addPropertyTableView.registerClass(InvestmentTableViewCell.self, forCellReuseIdentifier: "investment")
        self.view.addSubview(addPropertyTableView)*/
        
        NSNotificationCenter.defaultCenter().postNotificationName("addPropertyTapped", object: nil)
    }

}
