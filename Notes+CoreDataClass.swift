//
//  Notes+CoreDataClass.swift
//  Emotion
//
//  Created by Владислав Бороздин on 22.12.2021.
//
//

import Foundation
import CoreData

@objc(Notes)
public class Notes: NSManagedObject {
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}
