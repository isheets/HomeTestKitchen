//
//  User+CoreDataProperties.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?

}

extension User : Identifiable {

}
