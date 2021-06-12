//
//  PrivatePreview.swift
//  vcardX
//
//  Created by Nicolas Ott on 12.06.21.
//
import SwiftUI

struct PrivatePreview: View {
    
    @ObservedObject var settings: UserSettings
    @Binding var image: Image?
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(settings.firstName) \(settings.lastName)")
                    .foregroundColor(.prime)
                    .font(.headline)
                    .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Divider()
                
                Text("\(settings.mobilePrivate)")
                    .foregroundColor(.prime)
                    .font(.subheadline)
                    .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text("\(settings.emailPrivate)")
                    .foregroundColor(.prime)
                    .font(.subheadline)
                    .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text("\(settings.wwwPrivate)")
                    .foregroundColor(.prime)
                    .font(.subheadline)
                    .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            image?
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .frame(width: 68, height: 68)
                .shadow(radius: 5)
            
        }.padding()
    }
}

