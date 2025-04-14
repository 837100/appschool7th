//
//  WordResult.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import Foundation

struct WordResult: Codable, Identifiable{
    var id = UUID() // ForEach를 위한 안정적인 식별자 추가
    let definition: String?
    let partOfSpeech: String?
    let synonyms: [String]?
    let typeOf: [String]?
    let examples: [String]?
    
    enum CodingKeys: String, CodingKeys {
        case definition, partOfSpeech, synonyms, typeOf, examples
    }
    
}
