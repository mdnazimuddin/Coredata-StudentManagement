//
//  College+CoreDataProperties.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 11/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var university: String?
    @NSManaged public var students: NSSet?

}
