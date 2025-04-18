//
//  MenuItem.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/18/25.
//


import Foundation

struct MenuItem: Identifiable, Equatable, Decodable {
    
    struct Category: Equatable, Decodable {
        let name: String
    }
    
    enum CodingKeys: String, CodingKey {
        case categoryObject = "category"
        case name,spicy,price
        
    }
    
    let name: String
    let spicy: Bool
    let price: Double
    
    private let categoryObject: Category
    
    var id: String { name }
    var category: String { categoryObject.name }
    
    init(
        category: String,
        name: String,
        spicy: Bool,
        price: Double
    ) {
        self.categoryObject = Category(name: category)
        self.name = name
        self.spicy = spicy
        self.price = price
    }
    
}