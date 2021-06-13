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
        
        
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.imgBusinessSet, forKey: "imgBusinessSet")
        if settings.imgBusinessSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImageBusiness, forKey: "qrImageBusiness")
        }
        
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.imgPrivateSet, forKey: "imgPrivateSet")
        if settings.imgPrivateSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.qrImagePrivate, forKey: "qrImagePrivate")
        }
        
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.userImagePrivateSet, forKey: "userImagePrivateSet")
        if settings.userImagePrivateSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.userImagePrivate, forKey: "userImagePrivate")
        }
       
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.userImageBusinessSet, forKey: "userImageBusinessSet")
        if settings.userImageBusinessSet {
            UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.userImageBusiness, forKey: "userImageBusiness")
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
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.showUserPic, forKey: "showUserPic")

        WidgetCenter.shared.reloadAllTimelines()
    }
}

