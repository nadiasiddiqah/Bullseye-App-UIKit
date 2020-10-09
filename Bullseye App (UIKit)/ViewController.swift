//
//  ViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance properties
    var currentValue = 50       // initial value doesn't matter
    var targetValue = 0         // initial value doesn't matter
    var round = 0
    var totalScore = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!        // targetLabel Outlet references UILabel object
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    // Method for when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()     // starts first round when Viewcontroller loads
    }
    
    // Action method for when user taps the Button
    @IBAction func showAlert() {
      let difference = abs(currentValue - targetValue)
      var points = 100 - difference    // change let to var (since if statements add bonus points)
      
      let title: String
      if difference == 0 {
          title = "Perfect! 🎯"
          points = 200             // set bonus points for the round to 200 (for bullseye)
      } else if difference < 5 {
          title = "Almost had it! 😉"
          if difference == 1 {     // add extra logic for difference == 1
              points = 150         // set bonus points for the round to 150 (for one off)
          }
      } else if difference < 10 {
          title = "Pretty good! 👍🏾"
      } else {
          title = "Way off 👀"
      }
      totalScore += points   // move this down so that app updates points after if statements
        
        let message = "You hit \(currentValue). Your score is \(points) points this round!"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: {_ in 
                                            self.startNewRound()
                                            })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Action method for when user drags the slider
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)        // lroundf method = converts Double -> Int
    }
    
    // Method for when user starts a new round
    func startNewRound() {
      round += 1
      targetValue = Int.random(in: 1...100)    // generates a new random number
      currentValue = 50                        // resets currentValue to 50 (Int)
      slider.value = Float(currentValue)       // sets UISlider value by converting currentValue into float
      updateLabels()
    }

    // Method to update UILabels
    func updateLabels() {
        targetLabel.text = String(targetValue)      // sets UILabel value by converting targetValue into string
        totalScoreLabel.text = String(totalScore)
        roundLabel.text = String(round)
    }
}

