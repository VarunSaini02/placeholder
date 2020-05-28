//
//  ViewController.swift
//  RushHour
//
//  Created by Blake Branvold and Varun Saini on 4/7/20.
//  Copyright © 2020 Blake Branvold and Varun Saini. All rights reserved.
//

import UIKit

class RHGameBoard: UIViewController {
    
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

    
    var TapRecognizers = [[UITapGestureRecognizer]]()
    var PanRecognizers = [[UIPanGestureRecognizer]]()
    var ImageViews = [[UIImageView]]()
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
    
    var background = UIColor(red: CGFloat.random(in: 0.1...0.3), green: CGFloat.random(in: 0.1...0.3), blue: CGFloat.random(in: 0.1...0.3), alpha: 1.0)
    
    //array of cars that represents what is on the gameboard
    var cars = [Car]()
    //the highlighted (tapped) car
    var selected: Car?
    
    var carNumber = 4
    var a = 1
    
    var isRandomGenerated = false
    var levelToBuild = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Starting!")
        // Do any additional setup after loading the view.
        fillImageViewsAndTapRecognizers()
        resetButtonPressed(self)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        generator(carNumber)
    }
    
    //puts together the generator and the display functions
    func generator(_ numberOfCars: Int) {
        neutralGameBoard()
        if isRandomGenerated {
            generateCars(numberOfCars)
        } else {
            buildBlueprint(blueprint: Blueprint().levels[0][0][levelToBuild - 1])
        }
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
        background = UIColor(red: CGFloat.random(in: 0.1...0.3), green: CGFloat.random(in: 0.1...0.3), blue: CGFloat.random(in: 0.1...0.3), alpha: 1.0)
    }
    
    func buildBlueprint(blueprint: [Car]) {
        cars = [Car]()
        cars = blueprint
    }
    
    //generates non-user cars that do not overlap. numberOfCars is how many are generated.
    func generateCars(_ numberOfCars: Int) {
        cars = [Car]()
        cars.append(Car(1, 2, 4, true, Color("cyan")))
        
        var counterCarOverload = 0
        whileloop: while cars.count < numberOfCars {
            counterCarOverload += 1
            if (counterCarOverload > 100) {
                resetButtonPressed(self)
                break
            }
            
            let leftBottom = Int.random(in: 1...5)
            
            let rightTop = (leftBottom != 5) ? Int.random(in: (leftBottom + 1)...(leftBottom + 2)) : 6
            
            let constant = Int.random(in: 1...6)
            
            let isHorizontal = (Int.random(in: 0...1) == 1) ? true : false
            
            //var temporaryCar = Car(leftBottom, rightTop, constant, isHorizontal, Color(colorStrings[Int.random(in: 0...colorStrings.count - 1)]))
            
            let temporaryCar = Car(leftBottom, rightTop, constant, isHorizontal, Color())
            
            //throws out cars that make level not possible
            for car in cars {
                if temporaryCar.isTouching(car) || (temporaryCar.isHorizontal && temporaryCar.coordinates[0].y == 4) {
                    continue whileloop
                }
                if (car.isHorizontal == temporaryCar.isHorizontal) {
                    if (temporaryCar.isHorizontal == true && car.coordinates[0].y == temporaryCar.coordinates[0].y) {
                        continue whileloop
                    }
                    if (temporaryCar.isHorizontal == false && car.coordinates[0].x == temporaryCar.coordinates[0].x) {
                        continue whileloop
                    }
                }
                if (car.color.isTooSimilar(temporaryCar.color, CGFloat(0.25))) {
                    continue whileloop
                }
            }
            cars.append(temporaryCar)
        }
        cars[0].select()
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
                ImageViews[coordinate.x - 1][coordinate.y - 1].backgroundColor = cars[index].color.UIC
            }
        }
    }
    
    func fillImageViewsAndTapRecognizers() {
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
        
        //initialize user interaction
        for i in 0...5 {
            for j in 0...5 {
                ImageViews[i][j].isUserInteractionEnabled = true
            }
        }
        
        //initialize tap recognizers arrays
        for _ in 0...5 {
            TapRecognizers.append([UITapGestureRecognizer]())
            PanRecognizers.append([UIPanGestureRecognizer]())
        }
        
        //initialize tap recognizers in arrays
        for i in 0...5 {
            for _ in 0...5 {
                TapRecognizers[i].append(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
                PanRecognizers[i].append(UIPanGestureRecognizer(target: self, action: #selector(imageViewDragged)))
            }
        }
        
        //attach tap recognizers to image views
        for i in 0...5 {
            for j in 0...5 {
                ImageViews[i][j].addGestureRecognizer(TapRecognizers[i][j])
                ImageViews[i][j].addGestureRecognizer(PanRecognizers[i][j])
                PanRecognizers[i][j].maximumNumberOfTouches = 1
                PanRecognizers[i][j].minimumNumberOfTouches = 1
            }
        }
    }
    
    
    
    @objc func imageViewDragged(recognizer: UIPanGestureRecognizer) {
        guard let imageView = recognizer.view as? UIImageView else { return }
        for i in 0...5 {
            for j in 0...5 {
                if (imageView.isEqual(ImageViews[i][j])) {
                    clickedCoordinate(coordinate: Coordinate(i+1, j+1))
                }
            }
        }
        let translation = recognizer.translation(in: view)
    
        if recognizer.state != .cancelled {
            if selected?.isHorizontal ?? true {
                //right
                if translation.x > imageView.frame.width {
                    rightPressed(self)
                    //if ((selected?.isTouching(cars[0]))! && (selected?.hasCoordinate(compare: Coordinate(6, 4)))!) {
                        //rightPressed(self)
                    //}
                    recognizer.setTranslation(.zero, in: view)
                }
                //left
                if translation.x < -imageView.frame.width {
                    leftPressed(self)
                    recognizer.setTranslation(.zero, in: view)
                }
            } else {
                //up
                if translation.y < -imageView.frame.width {
                    upPressed(self)
                    recognizer.setTranslation(.zero, in: view)
                }
                //down
                if translation.y > imageView.frame.width {
                    downPressed(self)
                    recognizer.setTranslation(.zero, in: view)
                }
            }
        }
    }
    
    @objc func imageViewTapped(recognizer: UITapGestureRecognizer) {
        let imageView = recognizer.view as? UIImageView
        if imageView != nil {
            for i in 0...5 {
                for j in 0...5 {
                    if (imageView?.isEqual(ImageViews[i][j]))! {
                        clickedCoordinate(coordinate: Coordinate(i+1, j+1))
                        print("UIImageView at Coordinate: (\(i+1), \(j+1)) was tapped.")
                    }
                }
            }
        }
    }
    
    func clickedCoordinate(coordinate: Coordinate) {
        for car in cars {
            if car.hasCoordinate(compare: coordinate) {
                selected = car
                //car.color.display()
                //print(car.color.distinctColorIndex)
                car.select()
                //car.color.display()
            } else {
                car.deselect()
            }
        }
        updateCarsOnBoard()
    }
    
    @IBAction func rightPressed(_ sender: Any) {
        selected?.move(direction: "right", cars: cars, errorHandler: { (error) in
            if let err = error {
                print(err.localizedDescription)
                
                // resets level if the CarInfo type is .levelCompleted
                if case .levelComplete = err as? CarInfo {
                    self.resetButtonPressed(self)
                }
             }
        })
        updateCarsOnBoard()
    }
    
    @IBAction func leftPressed(_ sender: Any) {
        selected?.move(direction: "left", cars: cars, errorHandler: { (error) in
            if let err = error {
                print(err.localizedDescription)
            }
        })
        updateCarsOnBoard()
    }
    
    @IBAction func upPressed(_ sender: Any) {
        selected?.move(direction: "up", cars: cars, errorHandler: { (error) in
            if let err = error {
                print(err.localizedDescription)
            }
        })
        updateCarsOnBoard()
    }
    
    @IBAction func downPressed(_ sender: Any) {
        selected?.move(direction: "down", cars: cars, errorHandler: { (error) in
            if let err = error {
                print(err.localizedDescription)
            }
        })
        updateCarsOnBoard()
    }

}
