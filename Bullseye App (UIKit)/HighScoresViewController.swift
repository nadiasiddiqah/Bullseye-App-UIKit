//
//  HighScoresViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/20/20.
//

import UIKit

class HighScoresViewController: UITableViewController {
    
    // Store all instances of HighScoreItem (later add more to it)
    var items = [HighScoreItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        items = PersistencyHelper.loadHighScores()      // loads high scores from highScores.plist
        if (items.count == 0) {                         // if method fails ->
            resetHighScores()                           // load default high scores using resetHighScores()
        }
    }
    
    // MARK: - Actions
    
    // Reset tableView to original five items
    @IBAction func resetHighScores() {
        items = [HighScoreItem]()       // assign to empty array of HighScoreItem type
        
        let item1 = HighScoreItem()
        item1.name = "Nadia"
        item1.score = 50000
        items.append(item1)
        
        let item2 = HighScoreItem()
        item2.name = "Manda"
        item2.score = 10000
        items.append(item2)
        
        let item3 = HighScoreItem()
        item3.name = "Joey"
        item3.score = 5000
        items.append(item3)
        
        let item4 = HighScoreItem()
        item4.name = "Adam"
        item4.score = 1000
        items.append(item4)
        
        let item5 = HighScoreItem()
        item5.name = "Eli"
        item5.score = 500
        items.append(item5)
        
        tableView.reloadData()      // use reloadData to refresh tableView with reset state
        
        PersistencyHelper.saveHighScores(items)     // to save items after list is reset
    }

    // MARK: - Table view data source

    // Display numbers of rows (update return 0 -> items.count)
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int)
                            -> Int {
        return items.count   // # of HighScore objects in items array
    }

    // Display reusable cell using "indexPath" (contains Row#)
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
                            -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell",
                                                 for: indexPath)

        // Asks items array for the HighScoreItem object at the index that corresponds to row#
        let item = items[indexPath.row]

        // Configure the cell...
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel

        // provides "indexPath" with text data based on its row#
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        return cell
    }

    // MARK: - Table View Delegate

    // Change "user row tap behavior" to deselect row briefly after its tapped
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // Supports editing of tableView (to delete rows)
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        // Delete item @indexPath.row from items array (data model)
        items.remove(at: indexPath.row)
        
        // Delete corresponding row @indexPaths in tableView
        let indexPaths = [indexPath]        /// indexPaths local constant stores indexPath array (rows to delete)
        tableView.deleteRows(at: indexPaths, with: .automatic)      /// deleteRows(at: [IndexPath]) -> at requires index array
        
        PersistencyHelper.saveHighScores(items)     // to save items after an item is deleted
    }

}
