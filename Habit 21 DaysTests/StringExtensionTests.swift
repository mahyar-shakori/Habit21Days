//
//  File.swift
//  Habit 21 DaysTests
//
//  Created by Mahyar on 2/27/24.
//

import XCTest
@testable import Habit_21_Days

final class StringExtensionTests: XCTestCase {
    
    func testBasicDateConversion() {
        let dateString = "2023-01-01"
        let date = dateString.toDate(withFormat: "yyyy-MM-dd")
        XCTAssertNotNil(date, "The date should not be nil for a valid format and date string")
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let expectedDateString = dateFormatter.string(from: date)
            XCTAssertEqual(dateString, expectedDateString, "Converted date string should match input")
        }
    }

    
    func testInvalidDateConversion() {
        let invalidDateString = "invalid-date"
        let date = invalidDateString.toDate(withFormat: "yyyy-MM-dd")
        XCTAssertNil(date, "Date conversion should fail with an invalid date string")
    }
    
    func testDateConversionWithDifferentLocale() {
        let dateString = "01.05.2023"
        let date = dateString.toDate(withFormat: "dd.MM.yyyy", localeIdentifier: "de_DE")
        XCTAssertNotNil(date, "Date conversion should be successful with valid format and German locale")
    }
    
    func testDateConversionWithSpecificTimeZone() {
        let dateString = "2023-05-01 12:00"
        let expectedDate = dateString.toDate(withFormat: "yyyy-MM-dd HH:mm", localeIdentifier: "en_US_POSIX", timeZone: TimeZone(identifier: "America/New_York")!)
        let date = dateString.toDate(withFormat: "yyyy-MM-dd HH:mm", timeZone: TimeZone(identifier: "America/New_York")!)
        XCTAssertEqual(date, expectedDate, "The converted date should match the expected date with the specific time zone")
    }
}
