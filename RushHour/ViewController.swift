//
//  ViewController.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/7/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

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
        print("hi")
        // Do any additional setup after loading the view.
    }
}

class Car {
    var Coords = [Int]()
    
    init(x1: Int, x2: Int, y1: Int, y2: Int) {
        self.Coords[0] = x1
        self.Coords[1] = x2
        self.Coords[2] = y1
        self.Coords[3] = y2
    }
    
    func printCoords() {
        print(Coords)
    }
    
    func getCoords() -> [Int] {
        return Coords
    }
}

