//
//  LifecycleDemoApp.swift
//  LifecycleDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("Background")
            default:
                print("unknown scenephase")
            } // end of switch
        }
    } // end of body
} // end of struct
