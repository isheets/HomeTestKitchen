//
//  Tag+CoreDataProperties.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?

}

extension Tag : Identifiable {

}
