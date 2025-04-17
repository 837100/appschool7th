//
//  Models.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import Foundation

struct MenuItem: Identifiable, Equatable, Decodable {
    let category: String
    let name: String
    let spicy: Bool
    let price: Double
    
    var id: String {
        name
    }
    
}

struct MenuSection: Identifiable, Equatable {
    let category: String
    let items: [MenuItem]
    
    var id: String {
        category
    }
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    guard menu.isEmpty == false else { return [] }
    return Dictionary(grouping: menu, by: {$0.category})
        .map { category, items in
            MenuSection(category: category, items: items)
        }
        .sorted { $0.category > $1.category }
}


let menu = [
    MenuItem(category: "starters", name: "Caprese Salad", spicy: false, price: 12.5),
    MenuItem(category: "starters", name: "Arancini Balls", spicy: true, price: 10.0),
    MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: true, price: 15.0),
    MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 14.0),
    MenuItem(category: "drinks", name: "Water", spicy: false, price: 2.5),
    MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 8.0),
    MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 6.0),
    MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 7.0),
]
