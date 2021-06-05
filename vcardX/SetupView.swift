//
//  SetupView.swift
//  vcardX
//
//  Created by Nicolas Ott on 05.06.21.
//

import SwiftUI

struct SetupView: View {
    
    @ObservedObject var settings: UserSettings
   
    var body: some View {
        NavigationView {
            VStack {
                
            }.background(LinearGradient(gradient: Gradient(colors: [.prime, .primeInverted]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .onDisappear(perform: {
                settings.launchedBefore = true
            })
        }.navigationBarHidden(true)
    }
}
