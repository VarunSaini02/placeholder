//
//  Levels.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/11/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

//contains all pre-made levels
struct Blueprint {
    let levels = [[[[Car]]]]()
    
    init() {
        fillLevels()
    }
    
    // huge block of code that defines all the pre-made levels
    func fillLevels() {
        
    }
}

class Color {
    var colorIndex = -1
    let colorStrings =
    [
        "red",
        "orange",
        "green",
        "purple",
        "yellow",
        "pink",
        "cyan",
    ]
    
    var UIC: UIColor
    let UICs: [UIColor] =
    [
        UIColor(red: CGFloat(0.8), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.8), green: CGFloat(0.4), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.0), green: CGFloat(0.8), blue: CGFloat(), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.5), green: CGFloat(0.0), blue: CGFloat(0.5), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.8), green: CGFloat(0.8), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.8), green: CGFloat(0.0), blue: CGFloat(0.8), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.0), green: CGFloat(0.8), blue: CGFloat(0.8), alpha: CGFloat(1.0))
    ]
    
    let HUICs: [UIColor] =
    [
        UIColor(red: CGFloat(1.0), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(1.0), green: CGFloat(0.6), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.0), green: CGFloat(1.0), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.7), green: CGFloat(0.0), blue: CGFloat(0.7), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(1.0), green: CGFloat(1.0), blue: CGFloat(0.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(1.0), green: CGFloat(0.0), blue: CGFloat(1.0), alpha: CGFloat(1.0)),
        UIColor(red: CGFloat(0.0), green: CGFloat(1.0), blue: CGFloat(1.0), alpha: CGFloat(1.0))
    ]
    
    init(_ color: String) {
        for index in 0...(colorStrings.count - 1) {
            if color.elementsEqual(colorStrings[index]) {
                colorIndex = index
            }
        }
        UIC = UICs[colorIndex]
    }
    
    func highlight() {
        UIC = HUICs[colorIndex]
    }
    
    func unhighlight() {
        UIC = UICs[colorIndex]
    }
}
