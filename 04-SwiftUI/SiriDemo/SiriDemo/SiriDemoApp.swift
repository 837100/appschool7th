//
//  SiriDemoApp.swift
//  SiriDemo
//
//  Created by SG on 1/20/25.
//

import SwiftUI
import Intents

@main
struct SiriDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, initial: true) {
            INPreferences.requestSiriAuthorization { status in
                print("Srii authorization status: \(status.rawValue)")
            }
        }
    }
}
