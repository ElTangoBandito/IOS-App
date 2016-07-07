//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // Model
    
    let favoriteThings = [
        "Stuff",
        "Dogs",
        "Chocolate",
        "Music"
    ]

    // Mark: Table View Data Source Methods
    
    /**
    * Number of Rows
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.favoriteThings.count
    }

    
    /**
    * Cell For Row At Index Path
    */

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier("TestCell")!
        cell.textLabel?.text = self.favoriteThings[indexPath.row]
        cell.detailTextLabel?.text = "Testing"
        return cell
    }
}

