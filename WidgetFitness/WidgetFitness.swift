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
        SimpleEntry(date: Date(),txt: "Count: \(GetCount(table: "PushUp"))",txt2: "", configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),txt: "Start",txt2: "", configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let display = "P:\(GetCount(table: "PushUp")) S:\(GetCount(table: "SitUp")) k:\(GetCount(table: "KettleBell"))"
            let entry = SimpleEntry(date: entryDate,txt: display,txt2: "", configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let txt: String
    let txt2: String
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
                        Spacer()
                        VStack {
                            Text(entry.date, style: .time)
                                .padding(.all)
                            Text(entry.txt)
                            ZStack {
                                Color("C0")
                                VStack{
                                    HStack {
                                        Spacer()
                                        Text("Goal 21")
                                            .font(.title2)
                                            .multilineTextAlignment(.center)
                                            .padding([.top, .leading, .bottom], 1.0)
                                            .foregroundColor(.yellow)
                                        
                                        Spacer()
                                        
                                    }
                                }
                                .background(ContainerRelativeShape().fill(Color("Border")))
                                
                            }
                            
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                        Spacer(minLength: 20)
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
        WidgetFitnessEntryView(entry: SimpleEntry(date: Date(),txt: "Start",txt2: "", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
