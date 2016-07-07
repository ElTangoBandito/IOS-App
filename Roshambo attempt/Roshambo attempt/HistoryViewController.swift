//
//  HistoryViewController.swift
//  Roshambo attempt
//
//  Created by Hsu, KuoCheng on 7/7/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

var testArray2 = [String]()

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var userPick : [String]!
    var result : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userPick.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")!
        cell.textLabel?.text = self.result[indexPath.row]
        cell.detailTextLabel?.text = self.userPick[indexPath.row]
        return cell
    }
}