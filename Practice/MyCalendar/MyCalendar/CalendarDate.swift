//
//  CalendarDate.swift
//  MyCalendar
//
//  Created by 박상욱 on 2018. 3. 5..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation

class CalendarDate {
    let calendar = Calendar(identifier: .gregorian)
    let day: Int = 1
    var data: Date!
    var month: Int!
    var year: Int!
    
    
    init(year: Int, month: Int) {
        self.year = year
        self.month = month
        self.data = calendar.date(from: DateComponents(year: year, month: month, day: 1))
    }
    
    func monthData() -> Int {
        let month = calendar.component(.month, from: data!)

        return month
    }
    
    func firstDay() -> Int {
        let firstDay = calendar.component(.weekday, from: dataInput(year: year, month: month, day: 1))
        
        return firstDay
    }
    
    func dataInput(year: Int, month: Int, day: Int) -> Date{
        return calendar.date(from: DateComponents(year: year, month: month, day: day))!
    }
    
    func leapYear(year: Int, month: Int) -> Int {
        if month == 2 && year % 100 == 0 && year % 4 != 0 {
            return 29
        } else if month == 2 {
            return 28
        } else if month == 2 || month == 4 || month == 6 || month == 9 || month == 11 {
            return 30
        } else {
            return 31
        }
        
    }
}
