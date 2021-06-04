//
//  vcardXApp.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI
import Foundation

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
    
    //@State var tabSelected = 0
    @ObservedObject var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView(settings: settings)
                .accentColor(Color.primeInverted)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}
