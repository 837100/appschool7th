//
//  ContentView.swift
//  AppStorageDemo
//
//  Created by SG on 1/20/25.
//

import SwiftUI


///@AppStorage("KEY") var Name: Type = Value 형태로 선언

struct ContentView: View {

    @AppStorage("counter") var counter: Int = 0
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






//    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
//    var body: some View {
//
//        VStack {
//            Toggle("Dark Mode", isOn: $isDarkMode)
//                .padding()
//
//            Text(isDarkMode ? "Dark Mode is On" : "Dark Mode is Off")
//        }
//        .padding()
//        .background(isDarkMode ? Color.black : Color.white)
//        .foregroundColor(isDarkMode ? Color.white : Color.black)
//    }
//}
