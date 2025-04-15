//
//  AlbertosApp.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import SwiftUI

@main
struct AlbertosApp: App {
    var body: some Scene {
        WindowGroup {
            MenuList(sections: groupMenuByCategory(menu))
        }
    }
}
