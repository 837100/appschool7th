//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by SEONGGYEONG NO on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            List{}
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(colors[colorIndex])
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .padding()
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List{
                
                // 기본 피커 스타일을 ListItem 으로 사용할 경우 Label 이 표시됨
                // 기본 스타일에서는 레이블이 표시되지 않음
                // (접근성을 통한 VoiceOver 음성 안내에서만 활용됨)
                Picker(selection: $colorIndex, label: Text("Color")){
                    ForEach(0 ..< colornames.count, id: \.self) {
                        Text(colornames[$0])
                            .foregroundColor(colors[$0])
                    }
                }
            }
//            .pickerStyle(.wheel)
            .padding()
        } // end of VStack
    }
}


#Preview {
    ContentView()
}
