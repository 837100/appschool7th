//
//  ContentView.swift
//  WidgetDemo
//
//  Created by SG on 1/22/25.
//

import SwiftUI

struct WeatherType: Hashable {
    var name: String
    var icon: String
}

struct ContentView: View {
    
    @State var path: NavigationPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: WeatherType(name: "Hail Strom",
                                                  icon: "cloud.hail")) {
                    Label("Hall Strom", systemImage: "cloud.hail")
                }
                NavigationLink(value: WeatherType(name: "Thunder Storm",
                                                  icon: "cloud.bolt.rain")) {
                    Label("Thunder Strom", systemImage: "cloud.bolt.rain")
                }
                NavigationLink(value: WeatherType(name: "Tropical Strim",
                                                  icon: "tropicalStorm")) {
                    Label("Tropical Storm", systemImage: "tropicalstorm")
                }
            }
            .navigationDestination(for: WeatherType.self) { weather in
                WeatherDetailView(weather: weather)
            }
            .navigationTitle("Serve Weather")
            .onOpenURL { url in
                if !path.isEmpty {
                    path.removeLast(path.count)
                }
                switch url {
                case hailUrl: path.append(WeatherType(name: "Hail Storm", icon: "cloud.hail"))
                case thunderUrl: path.append(WeatherType(name: "Thunder Storm", icon: "cloud.bolt.rain"))
                case hailUrl: path.append(WeatherType(name: "Tropical Strim", icon: "tropicalStorm"))
                default:
                    break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
