//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/11/24.
//

import Foundation
import RealmSwift

final class RealmManager {
    
    private var realm: Realm?
    
    init() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // for delete no need to define this code
                    migration.enumerateObjects(ofType: Reminder.className()) { oldObject, newObject in
                        newObject?["dateCreate"] = Date()
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
        
        do {
            realm = try Realm()
        } catch {
            debugPrint("Error initializing Realm: \(error)")
            realm = nil
        }
    }
    
    private func performWriteOperation(_ operation: () -> Void) {
        guard let realm = realm else {
            debugPrint("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                operation()
            }
        } catch {
            debugPrint("Error performing write operation: \(error)")
        }
    }
    
    func fetchObjects<T: Object>(ofType type: T.Type) -> [T] {
        guard let realm = realm else {
            debugPrint("Realm is not initialized")
            return []
        }
        
        let results = realm.objects(type)
        return Array(results)
    }
    
    func addObject<T: Object>(_ object: T) {
        performWriteOperation {
            realm?.add(object)
        }
    }
    
    func deleteObject<T: Object>(_ object: T) {
        performWriteOperation {
            realm?.delete(object)
        }
        debugPrint("Delete action is done")
    }
    
    func incrementID(for type: Object.Type) -> Int {
        guard let realm = realm else {
            debugPrint("Realm is not initialized")
            return 1
        }
        guard let maxId = realm.objects(type).value(forKeyPath: "id.@max.intValue") as? Int else {
            return 1
        }
        return maxId + 1
    }
    
    func updateHabit(habitTitle: String, newTitle: String, updateDateCreate: Bool) {
        performWriteOperation {
            let habitsToUpdate = realm?.objects(Habit.self).filter("title == %@", habitTitle)
            
            habitsToUpdate?.forEach { habit in
                habit.title = newTitle
                
                if updateDateCreate {
                    habit.dateCreate = Date()
                }
            }
        }
    }
}
