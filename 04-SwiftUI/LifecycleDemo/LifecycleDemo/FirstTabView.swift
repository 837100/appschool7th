//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    
    @State var title = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAppear triggerd")
            })
            .onDisappear(perform: {
                print("onDisppered triggered ")
            })
            .task(priority: .background) { title = await changeTitle()
            }
    }
    
    
    func changeTitle() async -> String {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        } catch {
            print("Error: \(error)")
            return "View One"
        }
        return "Async task completed"
    }
}
#Preview {
    FirstTabView()
}

