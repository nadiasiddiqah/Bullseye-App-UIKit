//
//  ViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is \(currentValue)"
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)        // lroundf method = converts Double -> Int
    }

}

