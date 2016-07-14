//
//  Notebook.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/14/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import Foundation
import CoreData


class Notebook: NSManagedObject {

    convenience init(name: String = "New notebook", context: NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("Notebook", inManagedObjectContext: context){
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.name = name
            self.createdDate = NSDate()
        }
        else{
            fatalError("Unable to find entity Name!")
        }
    }
    
}
