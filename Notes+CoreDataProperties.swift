//
//  Notes+CoreDataProperties.swift
//  Emotion
//
//  Created by Владислав Бороздин on 22.12.2021.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var emotion: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var task: String?
    @NSManaged public var timestamp: Date?

}

extension Notes : Identifiable {

}

extension Notes {
    func setData(for model: AddTask.forDB) {
        self.emotion = Int16(model.emotion.id)
        self.task = model.task
        self.timestamp = model.timestamp
    }
    
    
}
