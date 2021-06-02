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
        
        // NavifgationView
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(Color("prime"))
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("primeInverted"))]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("primeInverted"))]
        coloredNavAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color("primeInverted"))]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().barTintColor = UIColor(Color("primeInverted"))
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
        //UITabBar.appearance().backgroundColor = UIColor.systemBackground
        
        // Segmented Picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "prime")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "prime") ?? Color.black], for: .normal)
    }
    
    @State var tabSelected = 0
    @ObservedObject var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabSelected) {
                ContentView(tabSelected: $tabSelected, settings: settings)
                    .tabItem {
                        Image(systemName: tabSelected == 0 ? "qrcode.viewfinder" : "qrcode")
                        Text("vCard")
                    }.tag(0)
                ContactsView(tabSelected: $tabSelected, settings: settings)
                    .tabItem {
                        Image(systemName: tabSelected == 1 ? "person.fill.viewfinder" : "person.fill")
                        Text("Contacts")
                    }.tag(1)
                SettingsView(tabSelected: $tabSelected, settings: settings) 
                    .tabItem {
                        Image(systemName: tabSelected == 2 ? "gearshape.fill" : "gearshape")
                        Text("Settings")
                    }.tag(2)
            }.accentColor(Color("primeInverted"))
        }
    }
}
