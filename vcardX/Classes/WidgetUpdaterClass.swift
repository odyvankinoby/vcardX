//
//  WidgetUpdaterClass.swift
//  vcardX
//
//  Created by Nicolas Ott on 06.06.21.
//


import SwiftUI
import WidgetKit

class WidgetUpdaterClass {
    
    @ObservedObject var settings: UserSettings
    
    init(settings: UserSettings) {
        self.settings = settings
    }
    
    func updateValues() {
        
        if settings.imgBusinessSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImageBusiness, forKey: "imgBusiness")
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.imgBusinessSet, forKey: "businessSet")
        }
        
        if settings.imgPrivateSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImagePrivate, forKey: "imgPrivate")
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.imgPrivateSet, forKey: "privateSet")
        }
        
        let name = "\(settings.firstName) \(settings.lastName)"
       
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(name, forKey: "name")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.position, forKey: "position")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.company, forKey: "company")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.mobilePrivate, forKey: "mobilePrivate")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.emailPrivate, forKey: "emailPrivate")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.wwwPrivate, forKey: "wwwPrivate")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.mobileBusiness, forKey: "mobileBusiness")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.emailBusiness, forKey: "emailBusiness")
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.wwwBusiness, forKey: "wwwBusiness")
        
        WidgetCenter.shared.reloadAllTimelines()
    }
}

