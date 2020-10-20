//
//  HighScoreItem.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/15/20.
//

import Foundation

// HighScoreItem class object combines name/score variables into one object
// Class object allows these variables to passed as reference variables
// HighScoreItem object adopts Codable protocol - enables it to save/load its data 
class HighScoreItem: Codable {
    var name = ""
    var score = 0
}

