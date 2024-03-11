//
//  File.swift
//  Habit 21 DaysTests
//
//  Created by Mahyar on 2/27/24.
//

import XCTest
@testable import Habit_21_Days

final class StringExtensionTests: XCTestCase {

    func testValidDateString() {
        let dateString = "2024-02-27"
        let format = "yyyy-MM-dd"
        let date = dateString.toDate(withFormat: format)
        XCTAssertNotNil(date, "تبدیل رشته به تاریخ باید موفقیت آمیز باشد")
    }
    
    func testInvalidDateString() {
        let dateString = "27-02-2024"
        let format = "yyyy-MM-dd"
        let date = dateString.toDate(withFormat: format)
        XCTAssertNil(date, "رشته نامعتبر باید nil برگرداند")
    }
    
    func testDifferentFormat() {
        let dateString = "02/27/2024"
        let format = "MM/dd/yyyy"
        let date = dateString.toDate(withFormat: format)
        XCTAssertNotNil(date, "تاریخ با فرمت متفاوت باید درست تبدیل شود")
    }
}
