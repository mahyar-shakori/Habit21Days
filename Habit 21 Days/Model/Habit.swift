//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import RealmSwift

final class Habit : Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var title : String = ""
    @Persisted var dateCreate : Date = Date()
    @Persisted var daysCount : Int = 0
    dynamic var daysCountCircular = CircularProgressView()
    
    @Persisted var reminders: List<Reminder>
}
