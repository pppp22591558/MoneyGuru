//
//  LoginViewController.swift
//  Money Guru
//
//  Created by Joshua Fang on 11/27/15.
//  Copyright © 2015 Joshua Fang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginPanel: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var guruIcon: UIImageView!
    @IBOutlet weak var moneyGuruText: UIImageView!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.contents = UIImage(named: "Signup Background.png")!.CGImage
        
        loginPanel.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1.0).CGColor
        loginPanel.layer.borderWidth = 3.5
        guruIcon.contentMode = .ScaleAspectFit
        moneyGuruText.contentMode = .ScaleAspectFit
        
        loginButton.addTarget(self, action: "loginToApp:", forControlEvents: UIControlEvents.TouchUpInside)
        
        usernameField.layer.borderColor = UIColor(red: 0.721, green: 0.494, blue: 1.0, alpha: 1.0).CGColor
        usernameField.layer.borderWidth = 2.5
        passwordField.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1.0).CGColor
        passwordField.layer.borderWidth = 2.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginToApp(sender: UIButton) {
        performSegueWithIdentifier("loginToApp", sender: nil)
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
