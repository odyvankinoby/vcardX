//
//  vcardXApp.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI

@main
struct vcardXApp: App {
    
    let coloredNavAppearance = UINavigationBarAppearance()
    
    init() {

        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(Color.prime)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.primeInverted)]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.primeInverted)]
        coloredNavAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.primeInverted)]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().barTintColor = UIColor(Color.primeInverted)
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.prime)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.prime)], for: .normal)

    }
    
    @State var tabSelected = 0
    @ObservedObject var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView(tabSelected: $tabSelected, settings: settings)
                .accentColor(Color.primeInverted)
                
            /*
            TabView(selection: $tabSelected) {
                ContentView(tabSelected: $tabSelected, settings: settings)
                    .tabItem {
                        Image(systemName: tabSelected == 0 ? "qrcode.viewfinder" : "qrcode")
                        Text(loc_vcard)
                    }.tag(0)
                 ContactsView(tabSelected: $tabSelected, settings: settings)
                    .tabItem {
                        Image(systemName: tabSelected == 1 ? "person.fill.viewfinder" : "person.fill")
                        Text(loc_contacts)
                    }.tag(1)
                CustomView(tabSelected: $tabSelected, settings: settings)
                    .tabItem {
                        Image(systemName: tabSelected == 3 ? "doc.text.viewfinder" : "doc.text")
                        Text(loc_custom)
                    }.tag(3)
                SettingsView(tabSelected: $tabSelected, settings: settings) 
                    .tabItem {
                        Image(systemName: tabSelected == 2 ? "gearshape.fill" : "gearshape")
                        Text(loc_settings)
                    }.tag(2)
                AboutView(tabSelected: $tabSelected)
                    .tabItem {
                        Image(systemName: tabSelected == 3 ? "info.circle.fill" : "info.circle")
                        Text(loc_about)
                    }.tag(4)
                
            }.accentColor(Color.primeInverted)
            */
        }
    }
}
