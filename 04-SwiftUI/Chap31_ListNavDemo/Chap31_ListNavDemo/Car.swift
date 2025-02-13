//
//  Car.swift
//  Chap31_ListNavDemo
//
//  Created by SG on 1/15/25.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
