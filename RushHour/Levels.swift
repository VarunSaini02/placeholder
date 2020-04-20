//
//  Levels.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/11/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

//contains all pre-made levels
class Blueprint {
    var levels = [[[[Car]]]]()
    
    init() {
        fillLevels()
    }
    
    // huge block of code that defines all the pre-made levels
    func fillLevels() {
        //original package of levels (levels[0])
        levels.append([[[Car]]]())
        
        //adding three difficulties to levels[0] package and appropriate levels (empty cars arrays) in each of those
        for index in 1...3 {
            levels[0].append([[Car]]())
            if index == 3 {
                for _ in 1...9 {
                    levels[0][index - 1].append([Car]())
                }
            } else {
                for _ in 1...10 {
                    levels[0][index - 1].append([Car]())
                }
            }
        }

        //the cars array for Package: levels[0], Difficulty: levels[0][0], and Level: levels[0][0][0].

        
        //Level 1
        addCarToLevel(level: 1, startCoord: 2, endCoord: 3, oppCoord: 4, isNotFlipped: true, isFirstCar: true)
        addCarToLevel(level: 1, startCoord: 1, endCoord: 2, oppCoord: 6, isNotFlipped: true)
        addCarToLevel(level: 1, startCoord: 3, endCoord: 5, oppCoord: 1, isNotFlipped: false)
        addCarToLevel(level: 1, startCoord: 1, endCoord: 2, oppCoord: 1, isNotFlipped: false)
        addCarToLevel(level: 1, startCoord: 3, endCoord: 5, oppCoord: 1, isNotFlipped: true)
        addCarToLevel(level: 1, startCoord: 3, endCoord: 5, oppCoord: 4, isNotFlipped: false)
        addCarToLevel(level: 1, startCoord: 5, endCoord: 6, oppCoord: 2, isNotFlipped: true)
        addCarToLevel(level: 1, startCoord: 4, endCoord: 6, oppCoord: 6, isNotFlipped: false)
        
        //Level 2
        addCarToLevel(level: 2, startCoord: 1, endCoord: 2, oppCoord: 4, isNotFlipped: true, isFirstCar: true)
        addCarToLevel(level: 2, startCoord: 1, endCoord: 3, oppCoord: 3, isNotFlipped: true)
        addCarToLevel(level: 2, startCoord: 1, endCoord: 2, oppCoord: 1, isNotFlipped: true)
        addCarToLevel(level: 2, startCoord: 4, endCoord: 6, oppCoord: 6, isNotFlipped: true)
        addCarToLevel(level: 2, startCoord: 4, endCoord: 5, oppCoord: 1, isNotFlipped: true)
        addCarToLevel(level: 2, startCoord: 5, endCoord: 6, oppCoord: 2, isNotFlipped: true)
        addCarToLevel(level: 2, startCoord: 5, endCoord: 6, oppCoord: 1, isNotFlipped: false)
        addCarToLevel(level: 2, startCoord: 1, endCoord: 2, oppCoord: 3, isNotFlipped: false)
        addCarToLevel(level: 2, startCoord: 4, endCoord: 5, oppCoord: 4, isNotFlipped: false)
        addCarToLevel(level: 2, startCoord: 3, endCoord: 4, oppCoord: 5, isNotFlipped: false)
        addCarToLevel(level: 2, startCoord: 3, endCoord: 5, oppCoord: 6, isNotFlipped: false)
        
    }
    
    func addCarToLevel(package: Int = 0, difficulty: Int = 0, level: Int, startCoord: Int, endCoord: Int, oppCoord: Int, isNotFlipped: Bool, isFirstCar: Bool = false){
        if (isFirstCar){
            
        levels[package][difficulty][level-1].append(Car(startCoord, endCoord, oppCoord, isNotFlipped, Color("cyan")))
            
        } else{
            
        levels[package][difficulty][level-1].append(Car(startCoord, endCoord, oppCoord, isNotFlipped, Color()).fix(cars: levels[package][difficulty][level-1]))
            
        }
    }

}

class Color {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var isHighlighted = false
    
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
    let UICs: [[CGFloat]] =
    [
        //RGB values scaled down to 0.0 – 1.0
        [0.8, 0.0, 0.0],
        [0.8, 0.4, 0.0],
        [0.0, 0.8, 0.0],
        [0.5, 0.0, 0.5],
        [0.8, 0.8, 0.0],
        [0.8, 0.0, 0.8],
        [0.0, 0.8, 0.8]
    ]
    
    
    init(_ color: String) {
        for index in 0...(colorStrings.count - 1) {
            if color.elementsEqual(colorStrings[index]) {
                colorIndex = index
            }
        }
        
        red = UICs[colorIndex][0]
        green = UICs[colorIndex][1]
        blue = UICs[colorIndex][2]
        UIC = UIColor(red: UICs[colorIndex][0], green: UICs[colorIndex][1], blue: UICs[colorIndex][2], alpha: 1.0)
    }
    
    init() {
        let whichIsZero = Int.random(in: 1...7)
        
        red = CGFloat.random(in: 0.5...0.8)
        green = CGFloat.random(in: 0.5...0.8)
        blue = CGFloat.random(in: 0.5...0.8)
        
        switch whichIsZero {
        case 1:
            red = CGFloat(0.0)
        case 2:
            green = CGFloat(0.0)
        case 3:
            blue = CGFloat(0.0)
        case 4:
            red = CGFloat(0.0)
            green = CGFloat(0.0)
        case 5:
            green = CGFloat(0.0)
            blue = CGFloat(0.0)
        case 6:
            blue = CGFloat(0.0)
            red = CGFloat(0.0)
        default:
            break
        }
        
        UIC = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func highlight() {
        if isHighlighted == false {
            red += (red != 0.0) ? 0.2 : 0.0
            green += (green != 0.0) ? 0.2 : 0.0
            blue += (blue != 0.0) ? 0.2 : 0.0
            UIC = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
        isHighlighted = true
    }
    
    func unhighlight() {
        if isHighlighted == true {
            red -= (red != 0.0) ? 0.2 : 0.0
            green -= (green != 0.0) ? 0.2 : 0.0
            blue -= (blue != 0.0) ? 0.2 : 0.0
            UIC = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
        isHighlighted = false
    }
    
    func isTooSimilar(_ other: Color, _ threshold: CGFloat) -> Bool {
        return !((other.red - self.red).magnitude > threshold || (other.green - self.green).magnitude > threshold || (other.blue - self.blue).magnitude > threshold)
    }
    
    func display() {
        print("[\(red), \(green), \(blue)]")
    }
    
}
