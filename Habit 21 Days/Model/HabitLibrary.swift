//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/4/24.
//

import RealmSwift

final class HabitLibrary : Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var title : String = ""
}
