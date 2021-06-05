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
        TabView {
            Welcome(settings: settings)
            Setup(settings: settings)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
        .onDisappear(perform: {
            settings.launchedBefore = true
        })
    }
}

struct Welcome: View {
    
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

struct Setup: View {
    
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
                
                VStack(alignment: .center) {
                    Text("Setup").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    //Text(loc_widget_displayname).font(.title2).foregroundColor(.white)
                    Text(loc_vcard).font(.title3).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }.padding()
               
                HStack(alignment: .top) {
                    Image("setup")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Tap the 􀍡 icon on top right of homescreen to edit the currently displayed contact business or private.").foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
               
                
                VStack(alignment: .leading) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                    {
                        Text("Start vcardX")
                    }.customButton()
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.trailing, 20)
            }
        }
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
    }
}
