//
//  RecipeRepo.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 7/19/21.
//

import Foundation
import CoreData

class RecipeRepo {

    public func create(_ recipe: Recipe) {

        
    }

    public func fetchAndBind(_ target: @escaping ([RecipeEntity]) -> Bool) {

        self.listeners.append(target)

    }

    init(container: NSPersistentContainer) {
        self.container = container


        // Add Observer
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(managedObjectContextObjectsDidChange),
            name: NSNotification.Name.NSManagedObjectContextObjectsDidChange,
            object: container.viewContext
        )
    }


    private let container: NSPersistentContainer

    private var listeners: [([RecipeEntity]) -> Bool] = []

    @objc private func managedObjectContextObjectsDidChange(notification: Notification) {
        if let inserts = notification.insertedObjects {
            var recipes: [Recipe] = []
            for insert in inserts {
                if let recipe = insert as? Recipe {
                    recipes.append(recipe)
                }
            }

            for var i in 0..<listeners.count {
                if !listeners[i](recipes) {
                    listeners.remove(at: i)
                    i -= 1
                }
            }
        }

    }
    @objc private func managedObjectContextWillSave() {

    }
    @objc private func managedObjectContextDidSave() {

    }
}


extension Dictionary where Key == AnyHashable {
    func value<T>(for key: String) -> T? {
        return self[key] as? T
    }
}

extension Notification {
    var insertedObjects: Set<NSManagedObject>? {
        return userInfo?.value(for: NSInsertedObjectsKey)
    }

    var updatedObjects: Set<NSManagedObject>? {
        return userInfo?.value(for: NSUpdatedObjectsKey)
    }

    var deletedObjects: Set<NSManagedObject>? {
        return userInfo?.value(for: NSDeletedObjectsKey)
    }
}
