//
//  ViewController.swift
//  Margins
//
//  Created by Thomas Verschoren on 22/11/15.
//  Copyright © 2015 Thomas Verschoren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toggleButton : UIButton!

    //Define Global Variables
    var currentColor: String = "white"
    var blackImage = UIImage(named: "blackToggle")
    var whiteImage = UIImage(named: "whiteToggle")
 
    
    //SetSystemVariables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.OnAppBecameActive), name: UIApplicationDidBecomeActiveNotification, object: nil)
        // refreshSettings()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ColorTapped(sender: AnyObject) {
        if currentColor == "white" {
            self.view.backgroundColor = UIColor.blackColor()
            currentColor = "black"
            toggleButton.setImage(whiteImage,forState:UIControlState.Normal)
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
            currentColor = "white"
            toggleButton.setImage(blackImage,forState:UIControlState.Normal)
        }
        print(currentColor)
    }
    
    @IBAction func ColorTappedBackground(sender: AnyObject) {
        let defaultsToggle = NSUserDefaults.standardUserDefaults()
        let toggleEnabled = defaultsToggle.boolForKey("taptoToggle")
        
        if toggleEnabled == true {
            if currentColor == "white" {
                self.view.backgroundColor = UIColor.blackColor()
                currentColor = "black"
                toggleButton.setImage(whiteImage,forState:UIControlState.Normal)
            }
            else {
                self.view.backgroundColor = UIColor.whiteColor()
                currentColor = "white"
                toggleButton.setImage(blackImage,forState:UIControlState.Normal)
            }
            print(currentColor)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func refreshSettings() {
        //ReadSettings
        let defaults = NSUserDefaults.standardUserDefaults()
        let settingNightMode = defaults.boolForKey("enableNightMode")
            //print("Nightmode: " + String(settingNightMode))
        let settingButton = defaults.boolForKey("hideButton")
            //print("Hide Button: " + String(settingButton))
        
        //NightMode
        if settingNightMode == false {
            self.view.backgroundColor = UIColor.whiteColor()
            currentColor = "white"
            toggleButton.setImage(blackImage,forState:UIControlState.Normal)
        }
        else {
            self.view.backgroundColor = UIColor.blackColor()
            currentColor = "black"
            toggleButton.setImage(whiteImage,forState:UIControlState.Normal)
        }
        
        //HideButton
        if settingButton == true {
            toggleButton.hidden = true
        }
        else {
            toggleButton.hidden = false
        }
        

    }
    
    func OnAppBecameActive()
    {
        // Add logic here to check if need to call refresh view method
        refreshSettings()
    }
}

