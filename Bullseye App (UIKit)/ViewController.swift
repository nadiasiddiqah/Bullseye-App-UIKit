//
//  ViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance properties
    var targetValue = 0         // initial value doesn't matter (changed by viewDidLoad())
    var sliderValue = 0         // initial value doesn't matter (changed by viewDidLoad())
    var totalScore = 0
    var round = 0
    
    @IBOutlet weak var targetLabel: UILabel!        // targetLabel Outlet references UILabel object
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    // Method for when app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame()     // starts new game when Viewcontroller loads
        customizedSlider()      // loads customized slider
    }
    
    // Action method for when user taps the Button
    @IBAction func showAlert() {
      let difference = abs(sliderValue - targetValue)
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
        
        let message = "You were off by \(difference). Your score is \(points) points this round!"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: {_ in 
                                            self.startNewGame()
                                            })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Action method for when user drags the slider
    @IBAction func sliderMoved(slider: UISlider) {
        sliderValue = lroundf(slider.value)        // lroundf method = converts Double -> Int
    }
    
    // Action method to start over when user presses the button
    @IBAction func startOver() {
        totalScore = 0
        round = 0
        startNewGame()
    }
    
    // Method for when user starts a new round/game
    func startNewGame() {
      addHighScore(totalScore)       // add totalScore to high scores list after each round
      round += 1
      targetValue = Int.random(in: 1...100)     // generates a new random number
      slider.value = Float(Int.random(in: 1...100))     // sets UISlider value by converting random# into float
      updateLabels()
    }

    // Method to update UILabels
    func updateLabels() {
        targetLabel.text = String(targetValue)      // sets UILabel value by converting targetValue into string
        totalScoreLabel.text = String(totalScore)
        roundLabel.text = String(round)
    }
    
    // Method to customize slider in IB
    func customizedSlider() {
        // Customize slider's setThumbImage (normal)
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        // Customize slider's setThumbImage (highlighted)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        // Define "inset" (view frame) dimensions of slider's track image
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        // Customize slider's setMinimumTrackImage
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        // Customize slider's setMaximumTrackImage
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    // Adds totalScore from each round to highScores screen
    func addHighScore(_ totalScore: Int) {
        guard totalScore > 0 else {
            return;
        }
        
        let highscore = HighScoreItem()
        highscore.score = totalScore
        highscore.name = "Unknown"
        
        var highScores = PersistencyHelper.loadHighScores()
        highScores.append(highscore)
        highScores.sort { $0.score > $1.score }     // ($0 - first parameter needs to be higher than $1 - second parameter)
        PersistencyHelper.saveHighScores(highScores)
    }

}
