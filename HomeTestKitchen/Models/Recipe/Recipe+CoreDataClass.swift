//
//  Recipe+CoreDataClass.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//
//

import Foundation
import CoreData

public struct RecipeEntity {
    let title: String
    let desc: String
    let createdDate: Date
    let estTime: Double
    let id: UUID
    let ingredients: Set<Ingredient>
    let tags: Set<Tag>
    let steps: Set<Step>
    let author: User
}

@objc(Recipe)
public class Recipe: NSManagedObject {
    init?(context: NSManagedObjectContext,
          entity: RecipeEntity) {
        super.init(
            entity: NSEntityDescription.entity(
                forEntityName: "Recipe",
                in: context
            )!,
            insertInto: context
        )
        self.title = entity.title
        self.desc = entity.desc
        self.createdDate = entity.createdDate
        self.estTime = entity.estTime
        self.id = entity.id
        self.ingredients = NSOrderedSet(objects: entity.ingredients)
        self.tags = NSSet(objects: entity.tags)
        self.steps = NSOrderedSet(objects: entity.steps)
        self.author = entity.author
    }
}
