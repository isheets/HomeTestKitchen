//
//  Repo.swift
//  Home Test Kitchen
//
//  Created by Isaac Sheets on 7/17/21.
//

import Foundation
import CoreData

class Repo {

    public let recipe: RecipeRepo

    init() {
        container = NSPersistentContainer(name: "Home_Test_Kitchen")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }

            print(storeDescription)
        })

        

        recipe = RecipeRepo(container: container)
    }

    private let container: NSPersistentContainer
    
}
