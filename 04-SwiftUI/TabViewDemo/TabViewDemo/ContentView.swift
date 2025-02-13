//
//  ContentView.swift
//  TabViewDemo
//
//  Created by SG on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("First Content view")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }
                .tag(0)
            Text("Seconde Content view")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }
                .tag(1)
            Text("Third Content view")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }
                .tag(2)
        }
        .font(.largeTitle)
                .tabViewStyle(PageTabViewStyle())
        HStack{
            Spacer()
            Button("1"){
                    selection = 0
            }
            .disabled(selection == 0)
            Spacer()
            Button("2"){
                    selection = 1
            }
            .disabled(selection == 1)
            Spacer()
            Button("3"){
                    selection = 2
            }
            .disabled(selection == 2)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
