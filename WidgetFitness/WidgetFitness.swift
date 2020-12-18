//
//  WidgetFitness.swift
//  WidgetFitness
//
//  Created by Mike Chirico on 12/18/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),txt: "Count: \(GetCount())", configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),txt: "Start", configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,txt: "Count: \(GetCount())", configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let txt: String
    let configuration: ConfigurationIntent
}

struct WidgetFitnessEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            VStack {
                
                ZStack {
                    
                    Color("C0")
                    
                    HStack {
                        VStack {
                            Text(entry.date, style: .time)
                            Text(entry.txt)
                        }
                    }
                }
            }
        }
    }
}

@main
struct WidgetFitness: Widget {
    let kind: String = "WidgetFitness"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetFitnessEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetFitness_Previews: PreviewProvider {
    static var previews: some View {
        WidgetFitnessEntryView(entry: SimpleEntry(date: Date(),txt: "Start", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
