//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/28/24.
//

import Foundation

extension String {
    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self)
    }
}
