//
//  DataManager.swift
//  Emotion
//
//  Created by Владислав Бороздин on 09.12.2021.
//

import Foundation
import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    let persistenceController = PersistenceController.shared
    
    func getNotes(completion: ([Notes]) -> Void) {
        guard let items = try? persistenceController.container.viewContext.fetch(Notes.fetchRequest()) else
        { completion([]); return }
        print(items.map({$0.emotion}))
        completion(items)
        
    }
    
    func getCategories(completion: ([Categories]) -> Void) {
        guard let items = try? persistenceController.container.viewContext.fetch(Categories.fetchRequest()) else
        { completion([]); return }
        print(items.count)
        completion(items)
        
    }

    func addCategory(for title: String, completion: (Categories?) -> Void) {
        let newItem = Categories(context: persistenceController.container.viewContext)
            newItem.setData(for: title)

            do {
                try persistenceController.container.viewContext.save()
                completion(newItem)
            } catch {
                completion(nil)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addTask(for model: AddTask.forDB, completion: (Notes?) -> Void) {
        let newItem = Notes(context: persistenceController.container.viewContext)
            newItem.setData(for: model)

            do {
                try persistenceController.container.viewContext.save()
                completion(newItem)
            } catch {
                completion(nil)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func updateTask(for model: AddTask.forDB, item: Notes, completion: (Notes?) -> Void) {
            item.setData(for: model)
            do {
                try persistenceController.container.viewContext.save()
                completion(item)
            } catch {
                completion(nil)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func delete(item: Notes) {
        persistenceController.container.viewContext.delete(item)

            do {
                try persistenceController.container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func delete(items: [Notes], completion: (Bool) -> Void) {
        for item in items {
            persistenceController.container.viewContext.delete(item)
        }
        do {
            try persistenceController.container.viewContext.save()
            completion(true)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            completion(false)
        }
    }
    

}
