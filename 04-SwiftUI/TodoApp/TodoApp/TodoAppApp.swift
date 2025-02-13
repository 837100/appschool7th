//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by SG on 1/20/25.
//

import SwiftUI
import SwiftData

@main
struct TodoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema(versionedSchema: SchemaV2.self)
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: false,
                                                    cloudKitDatabase: .automatic)

        do {
            let container = try ModelContainer(for: schema, migrationPlan: MigrationPlan.self, configurations: [modelConfiguration])
            print("Successfully created ModelContainer with migration")
            return container
        } catch {
            print("Failed to create ModelContainer: \(error)")
            print("error details: \(error.localizedDescription)")
            
            do {
                let configuration = ModelConfiguration(schema: schema,
                                                       isStoredInMemoryOnly: false)
                let container = try ModelContainer(for: schema, configurations: [configuration])
                print("Created fresh ModelContainer after error")
                return container
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
