//
//  RoutineComplication.swift
//  Notebook for Josh Watch App Complication
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SimpleTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(SimpleEntry(date: .now))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        // A static timeline policy is best since the content never changes
        let timeline = Timeline(entries: [SimpleEntry(date: .now)], policy: .never)
        completion(timeline)
    }
}

struct RoutineComplicationView: View {
    @Environment(\.widgetFamily) var family

    var body: some View {
        Group {
            switch family {
            case .accessoryCircular:
                ZStack {
                    AccessoryWidgetBackground()
                    Text("Josh")
                        .font(.headline)
                        .minimumScaleFactor(0.4) // Ensures it scales down to fit the circle
                }
            case .accessoryRectangular:
                VStack(alignment: .leading) {
                    Text("Josh")
                        .font(.headline)
                }
            case .accessoryInline:
                Text("Josh")
            case .accessoryCorner:
                ZStack {
                    AccessoryWidgetBackground()
                    Text("J") // A single letter usually fits better in the corner icon slot
                        .font(.headline)
                        .widgetLabel {
                            Text("Josh")
                        }
                }
            default:
                Text("Josh")
            }
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }
}

struct RoutineComplication: Widget {
    let kind = "com.joshclyde.routine-complication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SimpleTimelineProvider()) { entry in
            RoutineComplicationView()
                .privacySensitive(false)
        }
        .configurationDisplayName("Josh Complication")
        .description("Simply displays Josh and opens the app.")
        .supportedFamilies([
            .accessoryCircular,
            .accessoryRectangular,
            .accessoryInline,
            .accessoryCorner,
        ])
    }
}

#Preview("Circular", as: .accessoryCircular) {
    RoutineComplication()
} timeline: {
    SimpleEntry(date: .now)
}

#Preview("Rectangular", as: .accessoryRectangular) {
    RoutineComplication()
} timeline: {
    SimpleEntry(date: .now)
}

#Preview("Inline", as: .accessoryInline) {
    RoutineComplication()
} timeline: {
    SimpleEntry(date: .now)
}

#Preview("Corner", as: .accessoryCorner) {
    RoutineComplication()
} timeline: {
    SimpleEntry(date: .now)
}
