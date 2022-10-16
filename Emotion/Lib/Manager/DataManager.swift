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
    
    func delete(item: Notes) {
        persistenceController.container.viewContext.delete(item)

            do {
                try persistenceController.container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
