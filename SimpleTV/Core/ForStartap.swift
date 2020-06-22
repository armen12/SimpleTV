//
//  ForStartap.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 16.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
var arrayOfDays = [Date]()

let date = Date()
//var isFirstTime: Bool{
//    didSet{
//
////        isFirstTime = false
//    }
//}

func dateCreate(isFirstTime: Bool){
    let date1 = Date(dateString: "1996-02-07")
    let yeat = date1.timeIntervalSince(date)
}
extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
extension Date
{
    
      init(dateString:String) {
        let dateStringFormatter = DateFormatter()
      dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
 }
