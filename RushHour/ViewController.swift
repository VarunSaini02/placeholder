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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Starting!")
        // Do any additional setup after loading the view.
    }
}

class Car {
    var location = [Coordinate]()
    var isHorizontal: Bool
    
    // This initializer makes sure that cars are never wider than 1 block. Cars can be oriented vertically or horizontally, but their two width coordinates (theConstant) are always the same.
    init(leftBottom: Int, rightTop: Int, constant: Int, isHorizontal: Bool) {
        
        self.isHorizontal = isHorizontal
        
        //this is a horizontal car
        if (isHorizontal) {
            
        }
    }
    
    func printCoords() {
        print(location)
    }
    
    func getCoords() -> [Coordinate] {
        return location
    }
    
    func isTouchingCar(car: Car) -> Bool {
        return true //placeholder
    }
}

struct Coordinate {
    var x = 0
    var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

