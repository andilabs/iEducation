//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrzej Kostanski on 23.01.2015.
//  Copyright (c) 2015 Andrzej Kostanski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
 
        score += points
        
        let message = "You scored \(points)"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
                self.startNewRound()
                self.updateLabels()
            })
        alert.addAction(action)

        presentViewController(alert, animated: true, completion: nil)

//        startNewRound()
//        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

