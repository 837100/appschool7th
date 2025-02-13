//
//  ContentView.swift
//  AnimationDemo
//
//  Created by SG on 1/15/25.
//

import SwiftUI

struct ContentView: View {
//    @State private var offset: CGSize = .zero
//    @State private var scale : CGFloat = 1.0
    @State private var isTextVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                withAnimation(.easeInOut(duration: 3)) {
                    isTextVisible.toggle()
                }
            }, label: {
                Text("Toggle Text")
                    .font(.title2)
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape((.rect(cornerRadius: 10)))
            })
            if isTextVisible {
                Text("Hello SwiftUI Animation!")
                    .font(.largeTitle)
                    .padding()
                    
                    .transition(.opacity)
//                    .transition(.slide)
//                    .transition(.scale)
//                    .transition(.move(edge: .leading))
            }
            
        }
//        Circle()
//            .fill(Color.blue)
//            .frame(width: 100, height: 100)
//            .offset(offset)
//            .gesture(
//                DragGesture()
//                    .onChanged { gesture in
//                        withAnimation{
//                            self.offset =
//                            gesture.translation
//                        }
//                        
//                    }
//                    .onEnded { _ in
//                        withAnimation(.spring()){
//                            self.offset = .zero
//                        }
//                        
//                    }
//            )
        
//        Circle()
//            .fill(Color.blue)
//            .frame(width: 100, height: 100)
//            .scaleEffect(scale)
//            .animation(
//                .timingCurve(0.68, 0.6, 0.32, 1.6)
//                .delay(0.2)
//                .repeatCount(3, autoreverses: true),
//                value: scale
//            )
//            .onTapGesture {
//                scale = scale < 1.5 ? 2 : 1
//            }
        
        
        
    }
}

#Preview {
    ContentView()
}
