//
//  ContentView.swift
//  Lec0113_Chap28_StorageDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    // scene과 관련된 데이터를 저장하고 관리하는데 사용
    // sceneと関連したデータを格納して管理するこので使う
    @SceneStorage("city") var city: String = ""
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            TextEditor(text: $city)
//                .padding()
//                .border(Color.blue)
//        }
//        .padding()
        TabView {
            SceneStorageView()
                .tabItem{
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
