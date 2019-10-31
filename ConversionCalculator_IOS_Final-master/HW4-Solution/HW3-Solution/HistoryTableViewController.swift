//
//  HistoryTableViewController.swift
//  HW3-Solution
//
//  Created by Runquan Ye on 10/31/19.
//  Copyright © 2019 Jonathan Engelsma, Runquan Ye. All rights reserved.
//

import Foundation
import UIKit

class HistoryTableViewController : UITableViewController{
   
    var entries : [Conversion] = []
    var historyDelegate:HistoryTableViewControllerDelegate?

    // MARK: - Table view data source
    //override func numberOfSections(in tableView: UITableView) -> Int {
        // your code goes here
    //}

    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // your code goes here
    //}
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        // your code goes here.
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // use the historyDelegate to report back entry selected to the calculator scene
        if let del = self.historyDelegate {
            let conv = entries[indexPath.row]
            del.selectEntry(entry: conv)
        }
        
        // this pops back to the main calculator
       self.navigationController?.popViewController(animated: true)
    }
}
// this methode needs to be outside of the controller class
protocol HistoryTableViewControllerDelegate {
    func selectEntry(entry: Conversion)
}
