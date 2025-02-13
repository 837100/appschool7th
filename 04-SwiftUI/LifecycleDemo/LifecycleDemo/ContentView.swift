//
//  ContentView.swift
//  LifecycleDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem{
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                Text("Second")
                }
        }
    }
}

#Preview {
    ContentView()
}
