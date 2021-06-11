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
        
        if settings.qrBusinessSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImageBusiness, forKey: "imgBusiness")
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrBusinessSet, forKey: "businessSet")
        }
        
        if settings.qrPrivateSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImagePrivate, forKey: "imgPrivate")
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrPrivateSet, forKey: "privateSet")
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
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.purchased, forKey: "purchased")
        WidgetCenter.shared.reloadAllTimelines()
    }
}

