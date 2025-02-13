//
//  ContentView.swift
//  Lec0113_Chap27_Observable
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var timerData: TimerData = TimerData()
    @State var timerData: TimerData = TimerData()
    
    var body: some View {
//        NavigationView는 NavigationStack 으로 이름 변경됨.
        NavigationStack{
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink("Next Screen", destination: { 
                    SecondView()
                })
            }
        }
        // 느슨한 결합을 위해 사용 없으면 프리뷰에서 crash
        .environment(timerData)
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

#Preview {
    ContentView()
}
