//
//  vcardW.swift
//  vcardW
//
//  Created by Nicolas Ott on 04.06.21.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct widgetBundle: WidgetBundle {
    var body: some Widget {
        
        vcardBusiness()
        vcardPrivate()
        
    }
}

struct vcardBusiness: Widget {
    let kind: String = "vcardBusiness"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            wBusiness(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName(loc_widget_displayname)
        .description(loc_widgetB_description)
    }
}

struct vcardPrivate: Widget {
    let kind: String = "vcardPrivate"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            wPrivate(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName(loc_widget_displayname)
        .description(loc_widgetP_description)
    }
}


struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    
    let date: Date
    let purchased: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "purchased"))
    let showUserPic: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "showUserPic"))
    
    let qrBSet: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "imgBusinessSet"))
    let qrB: Data = Data(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.data(forKey: "qrImageBusiness") ?? Data())
    
    let qrPSet: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "imgPrivateSet"))
    let qrP: Data = Data(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.data(forKey: "qrImagePrivate") ?? Data())
    
    let userImgBSet: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "userImageBusinessSet"))
    let userImgB: Data = Data(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.data(forKey: "userImageBusiness") ?? Data())
    
    let userImgPSet: Bool = Bool(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.bool(forKey: "userImagePrivateSet"))
    let userImgP: Data = Data(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.data(forKey: "userImagePrivate") ?? Data())

    let name: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "name") ?? "")
    let position: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "position") ?? "")
    let company: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "company") ?? "")
    let mobilePrivate: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "mobilePrivate") ?? "")
    let emailPrivate: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "emailPrivate") ?? "")
    let wwwPrivate: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "wwwPrivate") ?? "")
    let mobileBusiness: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "mobileBusiness") ?? "")
    let emailBusiness: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "emailBusiness") ?? "")
    let wwwBusiness: String = String(UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.string(forKey: "wwwBusiness") ?? "")
    
    let configuration: ConfigurationIntent
    
}
