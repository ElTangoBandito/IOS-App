//
//  NotebooksTableViewController.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/14/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit
import CoreData

class NotebooksTableViewController: CoreDataTableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoolNotes"
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let stack = delegate.stack
        
        let fr = NSFetchRequest(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "createdDate", ascending: false)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addNewNotebook(sender: AnyObject) {
        let nb = Notebook(name: "New Notebook", context: fetchedResultsController!.managedObjectContext)
        print("New notebook: \(nb)")
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let notebook = fetchedResultsController!.objectAtIndexPath(indexPath) as! Notebook
        let cell = tableView.dequeueReusableCellWithIdentifier("NotebookCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = notebook.name
        cell.detailTextLabel?.text = String(format: "%d notes", notebook.notes!.count)
        
        return cell
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "displayNote"{
            if let notesVC = segue.destinationViewController as? NotesViewController{
                let fr = NSFetchRequest(entityName: "Note")
                
                fr.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: false), NSSortDescriptor(key: "text", ascending: true)]
                
                let indexPath = tableView.indexPathForSelectedRow!
                let notebook = fetchedResultsController?.objectAtIndexPath(indexPath)
                
                let pred = NSPredicate(format: "notebook = %@", argumentArray: [notebook!])
                
                fr.predicate = pred
                let fc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: fetchedResultsController!.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
                
                notesVC.fetchedResultsController = fc

            }
        }
    }
}