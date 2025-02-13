//
//  ContentView.swift
//  Chap42_GestureDemo
//
//  Created by SG on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    let tap = TapGesture(count: 2)
        .onEnded({ _ in
            print("Double Tap")})
    
    let longPress = LongPressGesture()
        .onEnded({ _ in
            print("Long Press")
        })
    
    
    // @GestureState: 제스처가 진행되는 동안 값이 유지 되고, 제스처가 끝나면 초기값으로 돌아감.
    @GestureState var magnificationScale: CGFloat = 1
   
    var body: some View {
        
        let magnification =
        MagnificationGesture(minimumScaleDelta: 1)
//            .onChanged({ value in
//                print("Magnifying Change: \(value)")
//                self.magnificationScale = value
//            })
            .updating($magnificationScale) {
                value, state, transaction in
                state = value
                print("Magnifying")
                
            }
            .simultaneously(with: DragGesture())
            .onEnded{ _ in
                print("Magnifying End")
            }
        
        
        Image(systemName: "hand.point.right.fill")
            .gesture(
                //                TapGesture()
                //                    .onEnded{ _ in
                //                    print("Tapped")
                //                    }
                tap)
            .gesture(longPress)
            .gesture(magnification)
            .scaleEffect(magnificationScale)
            .frame(width: 100, height: 90)
    }
}

#Preview {
    ContentView()
}
