//
//  ContentView.swift
//  Typograpy
//
//  Created by SG on 2/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var letterSpacing: CGFloat = 0
    @State private var lineSpacing: CGFloat = 4
    @State private var fontSize: CGFloat = 14
    
    let sampleText: String = """
동해물과 백두산이 마르고 닳도록
하느님이 보우하사 우리 나라만세
"""
    var body: some View {
        VStack {
            Text(sampleText)
                .font(.system(size: fontSize))
                .lineSpacing(lineSpacing)
                .tracking(letterSpacing)
                .frame(maxHeight: 600)
            HStack {
                Text("글자 크기")
                Text("\(fontSize)")
                Slider(value: $fontSize, in: 8...24)
            }
            HStack {
                Text("글자 사이")
                Text("\(letterSpacing)")
                Slider(value: $letterSpacing, in: 0...20)
            }
            HStack {
                Text("글줄 사이")
                Text("\(lineSpacing)")
                Slider(value: $lineSpacing, in: 0...30)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
