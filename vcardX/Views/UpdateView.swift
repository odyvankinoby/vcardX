//
//  UpdateView.swift
//  vcardX
//
//  Created by Nicolas Ott on 10.06.21.
//

import SwiftUI

struct UpdateViewWrapper: View {
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            UpdateView(settings: settings, btn: false)
        }
        .accentColor(Color.primeInverted)
        .background(Color.prime)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(loc_new, displayMode: .automatic).allowsTightening(true)
    }
}

struct UpdateView: View {
    
    @ObservedObject var settings: UserSettings
    @State var btn: Bool? = true
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ScrollView {
                if self.btn ?? true {
                    HStack {
                        Spacer()
                        Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                        {
                            Image(systemName: "xmark").padding().foregroundColor(.primeInverted)
                        }
                    }
                } else {
                    HStack {
                        Spacer()
                    }
                }
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Image(self.btn ?? true ? "AppIcons" : "AppIcons")
                            .resizable()
                            .cornerRadius(18)
                            .frame(width: 96, height: 96)
                            .padding(10)
                            .frame(alignment: .leading)
                        VStack(alignment: .leading) {
                            Text(loc_welcome)
                                .font(.title)
                                .foregroundColor(self.btn ?? true ? .primeInverted : .prime)
                                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding(.bottom, 5)
                            Text("Version \(settings.appVersion)")
                                .font(.title3)
                                .foregroundColor(self.btn ?? true ? .primeInverted : .prime)
                        }.padding()
                    }
                    Text(loc_whatsnew)
                        .font(.headline)
                        .foregroundColor(self.btn ?? true ? .primeInverted : .prime)
                    Text(loc_rn)
                        .font(.subheadline)
                        .foregroundColor(self.btn ?? true ? .primeInverted : .prime)
                }
            }
            if self.btn ?? true {
                Group {
                    Spacer()
                    Spacer()
                    Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                    {
                        Text(loc_go)
                    }
                    .customButton()
                    .padding()
                }
            }
        }
        .padding()
        .background(self.btn ?? true ? Color.prime : Color.primeInverted)
        .edgesIgnoringSafeArea(.bottom)
    }
}
