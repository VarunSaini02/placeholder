//
//  Level.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/11/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class Level {
    var cars: [Car]
    var finishLine: Coordinate
    
    init(_ cars: [Car], _ finishline: Coordinate) {
        self.cars = cars
        self.finishLine = finishline
    }
}

struct Color {
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
    let UICs: [UIColor] = []
    
    
    
    init(_ color: String) {
        for index in 0...(colorStrings.count - 1) {
            if color.elementsEqual(colorStrings[index]) {
                colorIndex = index
            }
        }
        UIC = UICs[colorIndex]
    }
    
}
