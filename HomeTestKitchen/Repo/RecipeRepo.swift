//
//  RecipeRepo.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//

import Foundation
import CoreData

class RecipeRepo {

    public func add(_ recipe: Recipe) {
        
    }

    init(container: NSPersistentContainer) {
        self.container = container
    }

    private let container: NSPersistentContainer
}
