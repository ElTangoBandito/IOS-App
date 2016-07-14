//
//  Notebook+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/14/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Notebook {

    @NSManaged var createdDate: NSDate?
    @NSManaged var name: String?
    @NSManaged var notes: NSSet?

}
