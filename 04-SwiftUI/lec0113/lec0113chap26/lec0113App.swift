//
//  lec0113App.swift
//  lec0113
//
//  Created by SG on 1/13/25.
//

import SwiftUI

@main
struct lec0113App: App {
    // \. Environment의 프로퍼티에 엑세스 한다와 비슷한 의미.
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .background:
                    print("background")
            case .inactive:
                print("inactive")
            case .active:
                print("active")
            default :
                print("Unknown")
            }
        }
    }
}
