//
//  Car.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/11/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class Car {
    var isHorizontal: Bool
    var coordinates: [Coordinate]
    var color: UIColor
    
    var red: Double
    var green: Double
    var blue: Double
    
    // This initializer makes sure that cars are never wider than 1 block. Cars can be oriented vertically or horizontally, but their two width coordinates (theConstant) are always the same.
    init(_ leftBottom: Int, _ rightTop: Int, _ constant: Int, _ isHorizontal: Bool,  _ red: Double, _ green: Double, _ blue: Double, _ alpha: Double) {
        
        self.isHorizontal = isHorizontal
        coordinates = [Coordinate]()
        
        //this is a horizontal car
        if (isHorizontal) {
            var changingXValue = leftBottom
            while (changingXValue <= rightTop) {
                coordinates.append(Coordinate(changingXValue, constant))
                changingXValue += 1
            }
        }
            //this is a vertical car
        else {
            var changingYValue = leftBottom
            while (changingYValue <= rightTop) {
                coordinates.append(Coordinate(constant, changingYValue))
                changingYValue += 1
            }
        }
        
        self.red = red
        self.green = green
        self.blue = blue
        
        color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    func printCoordinates() {
        var text = "["
        for index in 0...coordinates.count - 1 {
            if index == (coordinates.count - 1) {
                text.append(coordinates[index].getString() + "]")
            } else {
                text.append(coordinates[index].getString() + "; ")
            }
        }
        print(text)
    }
    
    func hasCoordinate(compare: Coordinate) -> Bool {
        for coordinate in coordinates {
            if coordinate.equals(other: compare) {
                return true
            }
        }
        return false
    }
    
    func isTouching(_ car: Car) -> Bool {
        for coordinate in self.coordinates {
            for otherCoordinate in car.coordinates {
                if coordinate.equals(other: otherCoordinate) {
                    return true
                }
            }
        }
        return false
    }
    
    func move(direction: String, cars: [Car]) {
        
        var otherCars = cars
        var indexToRemove = 0
        
        for index in 0...otherCars.count-1 {
            if self.isTouching(otherCars[index]) {
                indexToRemove = index
            }
        }
        
        otherCars.remove(at: indexToRemove)
        
        if (direction.elementsEqual("right") && isHorizontal) {
            if (coordinates[coordinates.count - 1].x != 6) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[coordinates.count - 1].x + 1, coordinates[coordinates.count - 1].y)) {
                        willBeCollision = true
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.x += 1
                    }
                } else {
                    print("Car in the way.")
                }
            } else {
                print("Can't move there.")
            }
        } else if (direction.elementsEqual("left") && isHorizontal) {
            if (coordinates[0].x != 1) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[0].x - 1, coordinates[0].y)) {
                        willBeCollision = true
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.x -= 1
                    }
                } else {
                    print("Car in the way.")
                }
            } else {
                print("Can't move there.")
            }
        } else if (direction.elementsEqual("up") && !isHorizontal) {
            if (coordinates[coordinates.count - 1].y != 6) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[coordinates.count - 1].x, coordinates[coordinates.count - 1].y + 1)) {
                        willBeCollision = true
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.y += 1
                    }
                } else {
                    print("Car in the way.")
                }
            } else {
                print("Can't move there.")
            }
        } else if (direction.elementsEqual("down") && !isHorizontal) {
            if (coordinates[0].y != 1) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[0].x, coordinates[0].y - 1)) {
                        willBeCollision = true
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.y -= 1
                    }
                } else {
                    print("Car in the way.")
                }
            } else {
                print("Can't move there.")
            }
        } else if (!(direction.elementsEqual("right") || direction.elementsEqual("left") || direction.elementsEqual("up") || direction.elementsEqual("down"))) {
            print("Invalid direction parameter. (Coding error.)")
        } else {
            print("Car cannot move in that direction. (User error.)")
        }
        
    }
}

class Coordinate {
    var x = 0
    var y = 0
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    func equals(other: Coordinate) -> Bool {
        return (self.x == other.x && self.y == other.y)
    }
    
    func display() {
        print("(\(x), \(y))")
    }
    
    func getString() -> String {
        return ("(\(x), \(y))")
    }
}
