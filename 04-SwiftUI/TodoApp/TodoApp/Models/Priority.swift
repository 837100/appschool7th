//
//  Priority.swift
//  TodoApp
//
//  Created by SG on 1/21/25.
//

import Foundation

enum Priority: Int, Codable, CaseIterable {
    case low = 0
    case medium = 1
    case high = 2
    
    var title: String {
        switch self {
        case .low:
            "낮음"
        case .medium:
            "중간"
        case .high:
            "높음"
        }
    }
}
