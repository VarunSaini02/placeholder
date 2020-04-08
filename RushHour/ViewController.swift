//
//  ViewController.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/7/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

