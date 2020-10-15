//
//  HighScoresTableViewController.swift
//  Bullseye App (UIKit)
//
//  Created by Nadia Siddiqah on 10/14/20.
//

import UIKit

class HighScoresTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    // Display numbers of rows (update return 0 -> 5)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    // Display reusable cell based on "HighScoreCell" identifier + "indexPath" (contains row#)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath)
        
        // Configure the cell...
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        
        switch indexPath.row {
        case 0:
            nameLabel.text = "Nadia"
            scoreLabel.text = "50000"
        case 1:
            nameLabel.text = "Manda"
            scoreLabel.text = "10000"
        case 2:
            nameLabel.text = "Joey"
            scoreLabel.text = "5000"
        case 3:
            nameLabel.text = "Adam"
            scoreLabel.text = "1000"
        case 4:
            nameLabel.text = "Patrick"
            scoreLabel.text = "500"
        default:
            nameLabel.text = "error: invalid player"
            scoreLabel.text = "error: invalid score"
        }
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    // Change "user row tap behavior" to deselect row briefly after its tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
