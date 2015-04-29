//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Raphael Neuenschwander on 28.04.15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    var history = [RPSMatch]()
    
    let winLoose = "winLoose"
    
 
    @IBAction func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Count the number of match results in the array
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    // Populate the cells
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("winLoose") as! UITableViewCell
        let historyCell = self.history[indexPath.row]
        
        // Set the name , color and detail
        
        if historyCell.p1 == historyCell.p2 {
        cell.textLabel?.text = "It's a Tie"
            cell.textLabel?.textColor = UIColor.grayColor()
        } else {
            cell.textLabel?.text = historyCell.p1.defeats(historyCell.p2) ? "You Win" : "You Lose"
            cell.textLabel?.textColor = historyCell.p1.defeats(historyCell.p2) ? UIColor.blueColor() : UIColor.redColor()
        }
        
        if let detailTextLabel = cell.detailTextLabel {
            if historyCell.p1.defeats(historyCell.p2) || historyCell.p2.defeats(historyCell.p1) {
                detailTextLabel.text = "\(historyCell.winner) beats \(historyCell.loser)"
            } else {
                detailTextLabel.text = "It's a tie !"
            }
            
        }
    
        
        
        // Set the image
        
        if historyCell.p1 == historyCell.p2 {
            
            cell.imageView?.image = UIImage(named: "itsATie")
            
        } else {
            cell.imageView?.image = historyCell.p1.defeats(historyCell.p2) ? UIImage(named: "win") : UIImage(named: "lose")
        }
        
        return cell
        
    }


}
