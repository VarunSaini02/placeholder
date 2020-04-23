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
    var color: Color
    
    var isSelected = false
    
    // This initializer makes sure that cars are never wider than 1 block. Cars can be oriented vertically or horizontally, but their two width coordinates (theConstant) are always the same.
    init(_ leftBottom: Int, _ rightTop: Int, _ constant: Int, _ isHorizontal: Bool, _ color: Color) {
        
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
        
        self.color = color
        
    }
    
    
    func select() {
        if isSelected == false {
            self.color.highlight()
        }
        isSelected = true
    }
    
    func deselect() {
        if isSelected == true {
            self.color.unhighlight()
        }
        isSelected = false
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
    
    func getCoordinates() -> String {
        var text = "["
        for index in 0...coordinates.count - 1 {
            if index == (coordinates.count - 1) {
                text.append(coordinates[index].getString() + "]")
            } else {
                text.append(coordinates[index].getString() + "; ")
            }
        }
        return text
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
    
    func move(direction: String, cars: [Car]) throws {
        
        var otherCars = cars
        var indexToRemove = 0
        
        for index in 0...otherCars.count-1 {
            if self.isTouching(otherCars[index]) {
                indexToRemove = index
            }
        }
        
        var collisionCar: Car?
        
        otherCars.remove(at: indexToRemove)
        
        if (direction.elementsEqual("right") && isHorizontal) {
            if (coordinates[coordinates.count - 1].x != 6) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[coordinates.count - 1].x + 1, coordinates[coordinates.count - 1].y)) {
                        willBeCollision = true
                        collisionCar = car
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.x += 1
                    }
                } else {
                    throw CarInfo.carsCollided(movingCar: self, unmovingCar: collisionCar!)
                }
            } else if (indexToRemove == 0) {
                throw CarInfo.levelComplete
            } else {
                throw CarInfo.hitWall(movingCar: self, direction: direction)
            }
        } else if (direction.elementsEqual("left") && isHorizontal) {
            if (coordinates[0].x != 1) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[0].x - 1, coordinates[0].y)) {
                        willBeCollision = true
                        collisionCar = car
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.x -= 1
                    }
                } else {
                    throw CarInfo.carsCollided(movingCar: self, unmovingCar: collisionCar!)
                }
            } else {
                throw CarInfo.hitWall(movingCar: self, direction: direction)
            }
        } else if (direction.elementsEqual("up") && !isHorizontal) {
            if (coordinates[coordinates.count - 1].y != 6) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[coordinates.count - 1].x, coordinates[coordinates.count - 1].y + 1)) {
                        willBeCollision = true
                        collisionCar = car
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.y += 1
                    }
                } else {
                    throw CarInfo.carsCollided(movingCar: self, unmovingCar: collisionCar!)
                }
            } else {
                throw CarInfo.hitWall(movingCar: self, direction: direction)
            }
        } else if (direction.elementsEqual("down") && !isHorizontal) {
            if (coordinates[0].y != 1) {
                var willBeCollision = false
                for car in otherCars {
                    if car.hasCoordinate(compare: Coordinate(coordinates[0].x, coordinates[0].y - 1)) {
                        willBeCollision = true
                        collisionCar = car
                    }
                }
                if (willBeCollision == false) {
                    for coordinate in coordinates {
                        coordinate.y -= 1
                    }
                } else {
                    throw CarInfo.carsCollided(movingCar: self, unmovingCar: collisionCar!)
                }
            } else {
                throw CarInfo.hitWall(movingCar: self, direction: direction)
            }
        } else if (!(direction.elementsEqual("right") || direction.elementsEqual("left") || direction.elementsEqual("up") || direction.elementsEqual("down"))) {
            throw CarInfo.codingError(movingCar: self, invalidDirection: direction)
        } else {
            //vertical car going right/left or horizontal car going up/down
            throw CarInfo.invalidDirection(movingCar: self, direction: direction)
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

enum CarInfo: Error {
    case carsCollided(movingCar: Car, unmovingCar: Car)
    case levelComplete
    case hitWall(movingCar: Car, direction: String)
    case invalidDirection(movingCar: Car, direction: String)
    case codingError(movingCar: Car, invalidDirection: String)
}

extension CarInfo: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .carsCollided(let moving, let unmoving):
            return ("Car: \(moving.getCoordinates()) attempted a collision with Car: \(unmoving.getCoordinates()).")
        case .levelComplete:
            return ("Level has been completed!")
        case .hitWall(let movingCar, let direction):
            return ("Car: \(movingCar.getCoordinates()) attempted a collision with the \(direction) wall.")
        case .invalidDirection(let movingCar, let direction):
            let isOrNot = movingCar.isHorizontal ? "is a horizontal" : "is a vertical"
            return ("Car: \(movingCar.getCoordinates()) attempted to move \(direction) but \(isOrNot) car.")
        case .codingError(let movingCar, let invalidDirection):
            return ("Idiot programmers tried to make Car: \(movingCar.getCoordinates()) move in the \"\(invalidDirection)\" direction. Sad!")
        }
    }
}
