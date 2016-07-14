//
//  NotesViewController.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/14/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

class NotesViewController: CoreDataTableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNewNote(sender: AnyObject) {
        let n = Note(text: "I am a new note", context: self.fetchedResultsController!.managedObjectContext)
        print("Created a new note!")

    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let note = fetchedResultsController?.objectAtIndexPath(indexPath) as! Note
        let cell = tableView.dequeueReusableCellWithIdentifier("Note", forIndexPath: indexPath)
        
        cell.textLabel?.text = note.text
        
        return cell
    }
}
