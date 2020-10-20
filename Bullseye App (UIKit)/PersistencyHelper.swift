//
//  PersistencyHelper.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/16/20.
//

import Foundation

// Data-storing helper class - saves data, loads data, and fetches data on app's start-up

class PersistencyHelper {
    
    // Creates path to the plist as a URL
    static func dataFilePath() -> URL {
        let pListPath = FileManager.default.urls(for: .documentDirectory,
                                                in: .userDomainMask)
        return pListPath[0].appendingPathComponent("HighScores.plist")
    }
    
    // Saves encodedItems array into plist file
    static func saveHighScores(_ encodedItems: [HighScoreItem]) {
        let encoder = PropertyListEncoder()
        do {
            let encodedData = try encoder.encode(encodedItems)
            try encodedData.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    // Returns decodedItems array from HighScore.plist
    static func loadHighScores() -> [HighScoreItem] {
        var decodedItems = [HighScoreItem]()
        let pListPath = dataFilePath()
        if let pListData = try? Data(contentsOf: pListPath) {
            let decoder = PropertyListDecoder()
            do {
                decodedItems = try decoder.decode([HighScoreItem].self, from: pListData)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
        return decodedItems
    }
   
}
