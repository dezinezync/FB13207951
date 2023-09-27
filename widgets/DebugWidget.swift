//
//  DebugWidget.swift
//  widgets
//
//  Created by Nikhil Nigade on 27/09/23.
//

import SwiftUI
import WidgetKit

// MARK: - Widget
struct DebugWidget: Widget {
  public var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: "debugWidget",
      provider: DebugProvider(),
      content: { entry in
        Text("\(entry.date.timeIntervalSinceReferenceDate)")
          .containerBackground(Color("WidgetBackground"), for: .widget)
      })
    .contentMarginsDisabled()
    .configurationDisplayName("Debug")
    .description("Debugging Widget")
    .supportedFamilies([.systemSmall])
  }
}

// MARK: - Entry
struct DebugEntry: TimelineEntry {
  let date: Date
}

// MARK: - Provider
final class DebugProvider: TimelineProvider {
  typealias Entry = DebugEntry
  
  func placeholder(in context: Context) -> Entry {
    Entry(date: Date())
  }
  
  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    completion(Entry(date: Date()))
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let entry = Entry(date: Date())
    let timeline = Timeline(entries: [entry], policy: .never)
    completion(timeline)
  }
}
