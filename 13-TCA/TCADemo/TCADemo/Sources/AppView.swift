//
//  AppView.swift
//  TCADemo
//
//  Created by NO SEONGGYEONG on 4/24/25.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            CounterView(store: TCADemoApp.store)
                .tabItem {
                    Text("Counter 1")
                }
            
            CounterView(store: TCADemoApp.store)
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
