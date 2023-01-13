//
//  Notes+CoreDataProperties.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.01.2023.
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
    @NSManaged public var category: Categories?

}

extension Notes : Identifiable {

}

extension Notes {
    func setData(for model: AddTask.forDB) {
        self.emotion = Int16(model.emotion.id)
        self.task = model.description
        self.timestamp = model.timestamp
        self.category = model.category
    }
}
