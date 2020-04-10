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

//This is Varun checking Slack's Github app


class ViewController: UIViewController {

    @IBOutlet weak var x1y1: UIImageView!
    @IBOutlet weak var x2y1: UIImageView!
    @IBOutlet weak var x3y1: UIImageView!
    @IBOutlet weak var x4y1: UIImageView!
    @IBOutlet weak var x5y1: UIImageView!
    
    @IBOutlet weak var x1y2: UIImageView!
    @IBOutlet weak var x2y2: UIImageView!
    @IBOutlet weak var x3y2: UIImageView!
    @IBOutlet weak var x4y2: UIImageView!
    @IBOutlet weak var x5y2: UIImageView!
    
    @IBOutlet weak var x1y3: UIImageView!
    @IBOutlet weak var x2y3: UIImageView!
    @IBOutlet weak var x3y3: UIImageView!
    @IBOutlet weak var x4y3: UIImageView!
    @IBOutlet weak var x5y3: UIImageView!
    
    @IBOutlet weak var x1y4: UIImageView!
    @IBOutlet weak var x2y4: UIImageView!
    @IBOutlet weak var x3y4: UIImageView!
    @IBOutlet weak var x4y4: UIImageView!
    @IBOutlet weak var x5y4: UIImageView!
    
    @IBOutlet weak var x1y5: UIImageView!
    @IBOutlet weak var x2y5: UIImageView!
    @IBOutlet weak var x3y5: UIImageView!
    @IBOutlet weak var x4y5: UIImageView!
    @IBOutlet weak var x5y5: UIImageView!
    
    @IBOutlet weak var x1y6: UIImageView!
    @IBOutlet weak var x2y6: UIImageView!
    @IBOutlet weak var x3y6: UIImageView!
    @IBOutlet weak var x4y6: UIImageView!
    @IBOutlet weak var x5y6: UIImageView!
    
    var index = 0
    
    let BChoices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    let IChoices = [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    let NChoices = [31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]
    let GChoices = [46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60]
    let OChoices = [61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75]
    
    var forbidden = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func shuffleButtonPressed(_ sender: Any) {
    
    }
    func assignNum(forbidden: [Int]) -> Int{
        var random = Int.random(in: 0 ..< 15)
        
        for val in forbidden{
            if val == random{
                print("already taken")
                random = assignNum(forbidden: forbidden)
            }
        }
        return random
    }
    
    func assignB(){
        forbidden = []
        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(BChoices[index])
        x1y1.image = UIImage(named: "\(BChoices[index])")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(BChoices[index])
        x1y2.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(BChoices[index])
        x1y3.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(BChoices[index])
        x1y4.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(BChoices[index])
        x1y5.image = UIImage(named: "\(index)")
    }
    
    func assignI(){
        forbidden = []
        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        print(GChoices[index])
        x2y1.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x2y2.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x2y3.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x2y4.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x2y5.image = UIImage(named: "\(index)")
    }
    
    func assignN(){
        forbidden = []
        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x3y1.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x3y2.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x3y3.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x3y4.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x3y5.image = UIImage(named: "\(index)")
    }
    
    func assignG(){
        forbidden = []
        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x4y1.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x4y2.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x4y3.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x4y4.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x4y5.image = UIImage(named: "\(index)")
    }
    
    func assignO(){
        forbidden = []
        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x5y1.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x5y2.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x5y3.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x5y4.image = UIImage(named: "\(index)")

        index = assignNum(forbidden: forbidden)
        forbidden.append(index)
        x5y5.image = UIImage(named: "\(index)")
    }
    
}
