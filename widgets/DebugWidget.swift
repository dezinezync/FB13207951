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
        DebugView(date: entry.date)
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

// MARK: - DebugView
struct DebugView: View {
  let date: Date
  
  var body: some View {
    Grid {
      ForEach(0..<8) { row in
        GridRow {
          ForEach(0..<3, id: \.self) { column in
            Link(destination: URL(string: "widgetsdebug://tab/1")!, label: {
              MyView(date: date.addingTimeInterval(86400 * TimeInterval((row * 2) + column)))
            })
          }
        }
      }
    }
  }
}

// MARK: - Misc. Views
struct MyView: View {
  let date: Date
  
  var body: some View {
    Link(destination: URL(string: "widgetsdebug://tab/2")!, label: {
      SomeView(date: date)
    })
  }
}

struct SomeView: View {
  let date: Date
  
  var body: some View {
    Link(destination: URL(string: "widgetsdebug://tab/3")!, label: {
      LinkedView(date: date)
    })
  }
}

struct LinkedView: View {
  let date: Date
  
  var body: some View {
    Link(destination: URL(string: "widgetsdebug://tab/4")!, label: {
      Text("\(Int(date.timeIntervalSinceReferenceDate / 86400))")
        .font(.footnote)
    })
  }
}
