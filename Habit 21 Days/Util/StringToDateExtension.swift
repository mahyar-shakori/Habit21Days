//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/28/24.
//

import Foundation

extension String {
    func toDate(withFormat format: String, localeIdentifier: String = "en_US_POSIX", timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.timeZone = timeZone
        return dateFormatter.date(from: self)
    }
}
