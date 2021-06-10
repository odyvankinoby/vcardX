//
//  UpdateView.swift
//  vcardX
//
//  Created by Nicolas Ott on 10.06.21.
//

import SwiftUI

struct UpdateView: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        TabView {
            New(settings: settings)
            //Setup(settings: settings)
            //Widget(settings: settings)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
        .onDisappear(perform: {
            settings.launchedBefore = true
        })
    }
}

struct New_: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                {
                    Image(systemName: "xmark").padding().foregroundColor(.primeInverted)
                }
            }
            ScrollView  {
                HStack(alignment: .center) {
                    Image("AppIcon_lite")
                        .resizable()
                        .cornerRadius(18)
                        .frame(width: 96, height: 96, alignment: .center)
                    VStack(alignment: .leading) {
                        Text(loc_welcome).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text(loc_widget_description).font(.title3).foregroundColor(.white).allowsTightening(true)
                    }.padding(.leading, 10)
                   
                }.padding(20)
                VStack(alignment: .leading) {
                    Text(loc_welcome_text).font(.body).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }.padding(20)
            }
        }
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
    }
}

struct New: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                {
                    Image(systemName: "xmark").padding().foregroundColor(.primeInverted)
                }
            }
            ScrollView  {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center) {
                        Image("AppIcon_dark")
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: 64, height: 64)
                            .padding(.all, 10)
                            .frame(alignment: .leading)
                        VStack(alignment: .leading) {
                            Text(loc_whatsnew).font(.headline).foregroundColor(.primeInverted)
                        
                            Text("vcardX - Your vCards at hand!").font(.subheadline).foregroundColor(.primeInverted)
                        
                            Text("Version \(settings.appVersion)").font(.subheadline).foregroundColor(.primeInverted)
                        
                        }.padding()
                    }
                }
                .padding()
                VStack(alignment: .leading, spacing: 10) {
                    Text(loc_new).font(.headline).foregroundColor(.primeInverted)
                    Text(loc_rn).font(.subheadline).foregroundColor(.primeInverted)
                }
                .padding()
               
                Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                {
                    Text(loc_go)
                }.customButton()
            }.padding()
        }
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
    }
}
