//
//  RushHourMenu.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/15/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class RHMenu: UIViewController {
    
    @IBOutlet weak var levelStepper: UIStepper!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var carSlider: UISlider!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var levelTypeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //put stuff here
        if levelTypeSwitch.isOn {
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
    
    //preset to random or vice versa toggled
    @IBAction func levelTypeSwitchActivated(_ sender: Any) {
        if  levelTypeSwitch.isOn {
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
    
    @IBAction func stepperPressed(_ sender: Any) {
        levelLabel.text = "LEVEL \(Int(levelStepper.value))"
    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        carLabel.text = "\(Int(carSlider.value)) CARS"
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        performSegue(withIdentifier: "continue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameBoard = segue.destination as! RHGameBoard
        gameBoard.carNumber = Int(carSlider.value)
        gameBoard.isRandomGenerated = levelTypeSwitch.isOn
        gameBoard.levelToBuild = Int(levelStepper.value)
    }
}
