//
//  Notes+CoreDataClass.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.01.2023.
//
//

import Foundation
import CoreData
import SwiftUICharts

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
    
    var stringDate: String {
        if let date = timestamp {
             return dateFormatter.string(from: date)
        } else {
            return "d?"
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
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

extension Notes {
    
    func makeChartDataPoint() -> LineChartDataPoint {
        LineChartDataPoint(value: Double(self.emotion), xAxisLabel: self.dayS, description: self.task, date: self.timestamp)
    }
    
}

