//
//  Note.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/12/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {

    convenience init(text:String = "New Note", context: NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("Note", inManagedObjectContext: context){
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.text = text
            self.createdDate = NSDate()
        } else {
            fatalError("Unable to find Entity Name!")
        }
        
    }
    var humanReadableAge : String{
        get{
            let fmt = NSDateFormatter()
            fmt.timeStyle = .NoStyle
            fmt.dateStyle = .ShortStyle
            fmt.doesRelativeDateFormatting = true
            fmt.locale = NSLocale.currentLocale()
            
            return fmt.stringFromDate(createdDate!)
        }
    }

}
