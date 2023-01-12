//
//  Categories+CoreDataProperties.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.01.2023.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var title: String?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension Categories {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Notes)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Notes)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Categories : Identifiable {

}

extension Categories {
    func setData(for title: String) {
        self.title = title
    }
}
