//
//  Ingredient+CoreDataProperties.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var amount: Double
    @NSManaged public var unit: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?

}

extension Ingredient : Identifiable {

}
