//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/16/24.
//

import Foundation

struct HabitDaysCountUtility {
    
    private static var lastDaysCountDict = [Int: Int]()

    static func habitDaysCountUpdate(id: Int, createDate: Date) -> Int {
        let calendar = Calendar.current
        let now = Date()
        
        guard let next21Days = calendar.date(byAdding: .day, value: 22, to: createDate) else { return 0 }
        let diffInDays = calendar.dateComponents([.day], from: now, to: next21Days).day ?? 0
        let newDaysCount = max(diffInDays, 0)
        
        return newDaysCount
    }
}
