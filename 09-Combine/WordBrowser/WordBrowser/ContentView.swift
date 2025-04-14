//
//  ContentView.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Label
                }
        }
    }
}

#Preview {
    ContentView()
}
