//
//  Product.swift
//  SwiftDataDemo
//
//  Created by SG on 1/16/25.
//

import Foundation
import SwiftData

@Model
// 상속 받아서 변하면 파일이 깨지므로 final
final class Product {
    var name: String?
    var quantity: String?
    
    init(name: String , quantity: String) {
        self.name = name
        self.quantity = quantity
    }
    
    
}
