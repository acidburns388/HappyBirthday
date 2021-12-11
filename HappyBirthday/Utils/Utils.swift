//
//  Utils.swift
//  HappyBirthday
//
//  Created by intellithings on 11/12/2021.
//

import Foundation

class Utils: NSObject {
    static func getLeapYerasBetweenTwoYears(startYear: Int, endYear: Int) -> Int {
        var leapYearCounter: Int = 0
        for year in startYear..<endYear {
            if (year / 100 != 0) && (year / 4 == 0) {
                leapYearCounter += 1
            }
        }
        
        return leapYearCounter
    }
}
