//
//  RushHourMenu.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/15/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class RushHourMenu: UIViewController {
    
    @IBOutlet weak var levelStepper: UIStepper!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var carSlider: UISlider!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var levelTypeSwitch: UISwitch!
    
    @IBAction func levelTypeSwitchActivated(_ sender: Any) {
        
        if levelTypeSwitch.isOn{
            levelLabel.isHidden = true
            levelStepper.isHidden = true
            carLabel.isHidden = false
            carSlider.isHidden = false
        } else {
            levelLabel.isHidden = false
            levelStepper.isHidden = false
            carLabel.isHidden = true
            carSlider.isHidden = true
        }
        
    }
    
}
