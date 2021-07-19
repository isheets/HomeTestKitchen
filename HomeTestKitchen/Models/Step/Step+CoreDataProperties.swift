//
//  Step+CoreDataProperties.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var order: Int32
    @NSManaged public var instruction: String?
    @NSManaged public var id: UUID?

}

extension Step : Identifiable {

}
