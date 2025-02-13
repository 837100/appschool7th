//
//  AppIntent.swift
//  WeatherWidget
//
//  Created by SG on 1/22/25.
//

import WidgetKit
import AppIntents


struct WeatherLocation: AppEntity, InstanceDisplayRepresentable, TypeDisplayRepresentable {
    
    let locationData: LocationData
    
    var id: UUID { UUID() }
    var name: String { locationData.city }
    
    static var typeDisplayNmae: LocalizedStringResource = "Weather Location"
    static var defaultQuery = WeatherLocationQuery()
    
    // TypeDisplayRepresentable 프로토콜 요구사항
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(name: "Weather Location")
    }
    
    // InstanceDisplayRepresentable 프로토콜 요구사항
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(locationData.city)",
            subtitle: "" // 필요한 경우 부제목 추가
        )
    }
}


static let allLocations: [WeatherLocation] = [
    WeatherLocation(locationData: LocationData.london)
    WeatherLocation(locationData: LocationData.miami)
]
struct WeatherLocationQuery: EntityQuery {
    func entities(for indentifiers: [UUID]) async throws -> [WeatherLocation] {
        [
            WeatherLocation(locationData: LocationData.london),
            WeatherLocation(locationData: LocationData.miami),
        ]
    }
    
    func suggestedEntities() async throws -> some ResultsCollection {
        [
            WeatherLocation(locationData: LocationData.london),
            WeatherLocation(locationData: LocationData.miami)
        ]
    }
    
    
}

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }
    
    @Parameter(title: "Location", default: WeatherLocation(locationData: LocationData.london))
    var location: WeatherLocation
}
