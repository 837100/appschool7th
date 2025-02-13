//
//  SchemaV2.swift
//  TodoApp
//
//  Created by SG on 1/21/25.
//

import Foundation
import SwiftData

enum SchemaV2: VersionedSchema {
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [SchemaV2.TodoItem.self, Category.self]
    }
    
    @Model
    final class TodoItem {
        var id: String = UUID().uuidString
        var title: String = ""
        var isCompleted: Bool = false
        var dueDate: Date?
        var category: Category? = nil
        var createdAt: Date = Date()
        var priority: Priority = Priority.medium
        
        init(title: String,
             isCompleted: Bool = false,
             priority: Priority = Priority.medium,
             dueDate: Date? = nil,
             category: Category? = nil,
             createdAt: Date = Date()) {
            self.title = title
            self.isCompleted = isCompleted
            self.dueDate = dueDate
            self.category = category
            self.priority = priority
        }
       
    }
}
