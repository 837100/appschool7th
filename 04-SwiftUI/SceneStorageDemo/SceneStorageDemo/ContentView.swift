//
//  ContentView.swift
//  SceneStorageDemo
//
//  Created by SG on 1/20/25.
//

import SwiftUI

struct ContentView: View {
    
    ///@SceneStorage("KEY") var Name: Type = Value 형태로 선언
    @SceneStorage("counter") var counter: Int = 0

    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.largeTitle)

            Button("Increment") {
                counter += 1
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
