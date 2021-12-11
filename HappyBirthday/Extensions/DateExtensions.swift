//
//  DateExtensions.swift
//  HappyBirthday
//
//  Created by intellithings on 10/12/2021.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> Date? {
        let timeIntervalDiffrence: TimeInterval = lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
        return NSDate(timeIntervalSinceReferenceDate: timeIntervalDiffrence) as Date
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
