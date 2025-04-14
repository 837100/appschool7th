//
//  Model.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import Foundation

struct Word: Codable, Identifiable {
    var id: String { word }
    let word: String
    let results: [WordResult]?
    let pronuciation: Pronuciation?
    
    static let empty = Word(word: "", results: nil, pronuciation: nil)
    
}
