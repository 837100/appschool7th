//
//  ContentView.swift
//  ObservableDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerData = TimerData()
    
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Timer count =\(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount){
                    Text("Reset Counter")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timerData)
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

#Preview {
    ContentView()
}
