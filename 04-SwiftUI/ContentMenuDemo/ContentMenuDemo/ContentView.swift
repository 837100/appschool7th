//
//  ContentView.swift
//  ContentMenuDemo
//
//  Created by SG on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor: Color = .yellow
    @State private var backgroundColor: Color = .black
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .contextMenu{
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }, label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                })
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                }, label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                })
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .red
                }, label: {
                    Text("Blood Colors")
                    Image(systemName: "paintbrush.fill")
                })
                
            }
        
    }
}

#Preview {
    ContentView()
}
