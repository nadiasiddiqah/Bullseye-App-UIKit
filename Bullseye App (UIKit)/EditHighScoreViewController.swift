//
//  EditHighScoreViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/19/20.
//

import UIKit

class EditHighScoreViewController: UITableViewController {
    
    // MARK: - Action
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
