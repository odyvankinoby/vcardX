//
//  CustomView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//


import SwiftUI

struct CustomView: View {
    
    @Binding var tabSelected: Int
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
               
                
                
                
                Spacer()
                Text(loc_madewithlove)
                    .font(.caption)
                    .padding([.horizontal, .bottom])
                
            }
            .background(Color.primeInverted)
            .navigationBarTitle(loc_custom, displayMode: .automatic).allowsTightening(true)
        }
    }
}
