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
    
    var ImageViews = [[UIImageView]]()
    var imageNames = ["brown","green","purple","red"]
    
    var background = UIColor(red: CGFloat.random(in: 0.2...0.4), green: CGFloat.random(in: 0.2...0.4), blue: CGFloat.random(in: 0.2...0.4), alpha: 1.0)
    
    var cars = [Car]()
    var selected: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Starting!")
        // Do any additional setup after loading the view.
        fillImageViews()
        neutralGameBoard()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        generator(4)
    }
    
    //puts together the generator and the display functions
    func generator(_ numberOfCars: Int) {
        neutralGameBoard()
        generateCars(numberOfCars)
        selected = cars[0]
        
        for car in cars {
            car.printCoordinates()
        }
        print("")
        updateCarsOnBoard()
    }
    
    //makes the game board colors neutral again
    func neutralGameBoard() {
        newBackground()
        for i in 0...5 {
            for j in 0...5 {
                //ImageViews[i][j].image = UIImage(named: "NeutralSpace")
                ImageViews[i][j].image = nil
                ImageViews[i][j].backgroundColor = background
            }
        }
    }
    
    func newBackground() {
        background = UIColor(red: CGFloat.random(in: 0.2...0.4), green: CGFloat.random(in: 0.2...0.4), blue: CGFloat.random(in: 0.2...0.4), alpha: 1.0)
    }
    
    //generates non-user cars that do not overlap. numberOfCars is how many are generated.
    func generateCars(_ numberOfCars: Int) {
        cars = [Car]()
        whileloop: while cars.count < numberOfCars {
            let leftBottom = Int.random(in: 1...5)
            
            let rightTop = (leftBottom != 5) ? Int.random(in: (leftBottom + 1)...(leftBottom + 2)) : 6
            
            let constant = Int.random(in: 1...6)
            
            let isHorizontal = (Int.random(in: 0...1) == 1) ? true : false
            
            let temporaryCar = Car(leftBottom, rightTop, constant, isHorizontal, Double.random(in: 0.4...1), Double.random(in: 0.4...1), Double.random(in: 0.4...1), 1.0)
            
            for car in cars {
                if temporaryCar.isTouching(car) {
                    continue whileloop
                }
            }
            cars.append(temporaryCar)
        }
    }
    
    func updateCarsOnBoard() {
        for i in 0...5 {
            for j in 0...5 {
                ImageViews[i][j].image = nil
                ImageViews[i][j].backgroundColor = background
            }
        }
        for index in 0...cars.count-1 {
            for coordinate in cars[index].coordinates {
                //let color = imageNames[index % imageNames.count]
                //ImageViews[coordinate.x - 1][coordinate.y - 1].image = UIImage(named: color)
                ImageViews[coordinate.x - 1][coordinate.y - 1].backgroundColor = cars[index].color
            }
        }
    }
    
    func fillImageViews() {
        for _ in 0...5 {
            ImageViews.append([UIImageView]())
        }
        
        ImageViews[0].append(x1y1)
        ImageViews[0].append(x1y2)
        ImageViews[0].append(x1y3)
        ImageViews[0].append(x1y4)
        ImageViews[0].append(x1y5)
        ImageViews[0].append(x1y6)
        
        ImageViews[1].append(x2y1)
        ImageViews[1].append(x2y2)
        ImageViews[1].append(x2y3)
        ImageViews[1].append(x2y4)
        ImageViews[1].append(x2y5)
        ImageViews[1].append(x2y6)
        
        ImageViews[2].append(x3y1)
        ImageViews[2].append(x3y2)
        ImageViews[2].append(x3y3)
        ImageViews[2].append(x3y4)
        ImageViews[2].append(x3y5)
        ImageViews[2].append(x3y6)
        
        ImageViews[3].append(x4y1)
        ImageViews[3].append(x4y2)
        ImageViews[3].append(x4y3)
        ImageViews[3].append(x4y4)
        ImageViews[3].append(x4y5)
        ImageViews[3].append(x4y6)
        
        ImageViews[4].append(x5y1)
        ImageViews[4].append(x5y2)
        ImageViews[4].append(x5y3)
        ImageViews[4].append(x5y4)
        ImageViews[4].append(x5y5)
        ImageViews[4].append(x5y6)
        
        ImageViews[5].append(x6y1)
        ImageViews[5].append(x6y2)
        ImageViews[5].append(x6y3)
        ImageViews[5].append(x6y4)
        ImageViews[5].append(x6y5)
        ImageViews[5].append(x6y6)
    }
    
    @IBAction func rightPressed(_ sender: Any) {
        selected?.move(direction: "right")
        updateCarsOnBoard()
    }
    @IBAction func leftPressed(_ sender: Any) {
        selected?.move(direction: "left")
        updateCarsOnBoard()
    }
    
    @IBAction func upPressed(_ sender: Any) {
        selected?.move(direction: "up")
        updateCarsOnBoard()
    }
    @IBAction func downPressed(_ sender: Any) {
        selected?.move(direction: "down")
        updateCarsOnBoard()
    }
}
