//
//  ViewController.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/7/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

//varuns test again

import UIKit


//Need outlets and actions for every image :(
//Need half yellow, half (ANY CAR COLOR/GRAY) image to show exit?
//Need isSelected version of each image
//might be good to categorize images by car type
//Car swift class?


class ViewController: UIViewController {
    
    @IBOutlet weak var x1y1: UIImageView!
    @IBOutlet weak var x2y1: UIImageView!
    @IBOutlet weak var x3y1: UIImageView!
    @IBOutlet weak var x4y1: UIImageView!
    @IBOutlet weak var x5y1: UIImageView!
    @IBOutlet weak var x6y1: UIImageView!
    
    @IBOutlet weak var x1y2: UIImageView!
    @IBOutlet weak var x2y2: UIImageView!
    @IBOutlet weak var x3y2: UIImageView!
    @IBOutlet weak var x4y2: UIImageView!
    @IBOutlet weak var x5y2: UIImageView!
    @IBOutlet weak var x6y2: UIImageView!
    
    @IBOutlet weak var x1y3: UIImageView!
    @IBOutlet weak var x2y3: UIImageView!
    @IBOutlet weak var x3y3: UIImageView!
    @IBOutlet weak var x4y3: UIImageView!
    @IBOutlet weak var x5y3: UIImageView!
    @IBOutlet weak var x6y3: UIImageView!
    
    @IBOutlet weak var x1y4: UIImageView!
    @IBOutlet weak var x2y4: UIImageView!
    @IBOutlet weak var x3y4: UIImageView!
    @IBOutlet weak var x4y4: UIImageView!
    @IBOutlet weak var x5y4: UIImageView!
    @IBOutlet weak var x6y4: UIImageView!
    
    @IBOutlet weak var x1y5: UIImageView!
    @IBOutlet weak var x2y5: UIImageView!
    @IBOutlet weak var x3y5: UIImageView!
    @IBOutlet weak var x4y5: UIImageView!
    @IBOutlet weak var x5y5: UIImageView!
    @IBOutlet weak var x6y5: UIImageView!
    
    @IBOutlet weak var x1y6: UIImageView!
    @IBOutlet weak var x2y6: UIImageView!
    @IBOutlet weak var x3y6: UIImageView!
    @IBOutlet weak var x4y6: UIImageView!
    @IBOutlet weak var x5y6: UIImageView!
    @IBOutlet weak var x6y6: UIImageView!
    
    var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Starting!")
        // Do any additional setup after loading the view.
        
        generateCars(10)
        
        
        for car in cars {
            car.printCoordinates()
        }
    }
    
    //generates non-user cars that do not overlap. numberOfCars is how many are generated.
    func generateCars(_ numberOfCars: Int) {
        whileloop: while cars.count < numberOfCars {
            let leftBottom = Int.random(in: 1...6)
            
            let rightTop = (leftBottom != 6) ? Int.random(in: (leftBottom + 1)...6) : 6
            
            let constant = Int.random(in: 1...6)
            
            let isHorizontal = (Int.random(in: 0...1) == 1) ? true : false
            
            let temporaryCar = Car(leftBottom, rightTop, constant, isHorizontal)
            
            for car in cars {
                if temporaryCar.isTouching(car) {
                    continue whileloop
                }
            }
            cars.append(temporaryCar)
        }
    }
}

class Car {
    var isHorizontal: Bool
    var coordinates: [Coordinate]
    
    // This initializer makes sure that cars are never wider than 1 block. Cars can be oriented vertically or horizontally, but their two width coordinates (theConstant) are always the same.
    init(_ leftBottom: Int, _ rightTop: Int, _ constant: Int, _ isHorizontal: Bool) {
        
        self.isHorizontal = isHorizontal
        coordinates = [Coordinate]()
        
        //this is a horizontal car
        if (isHorizontal) {
            var changingXValue = leftBottom
            while (changingXValue <= rightTop) {
                coordinates.append(Coordinate(changingXValue, constant))
                changingXValue += 1
            }
        } else {
            var changingYValue = leftBottom
            while (changingYValue <= rightTop) {
                coordinates.append(Coordinate(constant, changingYValue))
                changingYValue += 1
            }
        }
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
    
    func getCoords() -> [Coordinate] {
        return coordinates
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
    
}

struct Coordinate {
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

