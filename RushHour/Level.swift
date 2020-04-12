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
