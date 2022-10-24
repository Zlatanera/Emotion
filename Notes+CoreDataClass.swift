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
    
    var dayS: String {
        if let date = timestamp {
            return dayFormatter.string(from: date)
        } else {
            return "D?"
        }
            
    }
    
    var monthS: String {
        if let date = timestamp {
             return monthFormatter.string(from: date)
        } else {
            return "M?"
        }
        
    }
    
    private let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }()
}
