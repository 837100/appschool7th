//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by SG on 1/22/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(),
                     city:"London", temperature: 89,
                     description: "Thunder Storm",
                     icon: "cloud.bolt.rain", image: "thunder", url: thunderUrl)
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WeatherEntry {
        configuration.location.locationData.timeline[0]
        
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WeatherEntry> {
        
        let timeline = configuration.location.locationData.timeline
        return Timeline(entries: timeline, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}


struct WeatherWidgetEntryView : View {
    
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color("weatherBackgroundColor")
            HStack {
                WeatherSubView(entry: entry)
                if widgetFamily == .systemMedium {
                    Image(entry.image)
                        .resizable()
                }
            }
        }
        .widgetURL(entry.url)
    }
}

struct WeatherSubView: View {
    var entry: WeatherEntry
    var body: some View {
        VStack {
            VStack {
                Text("\(entry.city)")
                    .font(.title)
                Image(systemName: entry.icon)
                
                Text("\(entry.description)")
                    .frame(minWidth: 125, minHeight: nil)
            }
            .padding(.bottom, 2)
            .background(ContainerRelativeShape()
                .fill(Color("weatherInsetColor")))
            
            Label("\(entry.temperature)°F", systemImage: "thermometer")
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WeatherWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        // 위젯 배경 위 아래 흰 줄 없애기
        .contentMarginsDisabled()
        .configurationDisplayName("My Weather Widget")
        .description("A demo weather widget")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}


// 작은 위젯을 보기 위한 프리뷰 코드
#Preview(as: .systemSmall) {
    WeatherWidget()
} timeline: {
    londonTimeline[0]
    miamiTimeline[0]
}

// 중간 크기 위젯을 보기 위한 프리뷰 코드
#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    londonTimeline[0]
    miamiTimeline[0]
}
