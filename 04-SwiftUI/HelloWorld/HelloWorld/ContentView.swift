//
//  ContentView.swift
//  HelloWorld
//
//  Created by SEONGGYEONG NO on 1/8/25.
//

import SwiftUI



// 커스텀 레이블 스타일 레이아웃
struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
                    
        Button("Show Alert"){
            showAlert = true
        }
        .alert("Important Message", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("This is an alert message.")
        }
        
        /* 후행 클로저 표현식
         .alert("Important Message",
                isPresented: $showAlert,
                actions: {
             Button("OK", role: .cancel) {}
         }, message: {
             Text("This is an alert message.")
         })
         */
    }
    
}

#Preview {
    ContentView()
}
