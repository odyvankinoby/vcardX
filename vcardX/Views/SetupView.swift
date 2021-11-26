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
            Widget(settings: settings)
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
                    Image("AppIcons")
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
                    Text(loc_create_vcards).font(.title).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Image("setup")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                    Text(loc_create_vcards_text).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding(10)
                    Spacer()
                }.padding()
            }
        }
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Widget: View {
    
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
                    Text(loc_add_widgets).font(.title).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text(loc_req_premium).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Image("widget")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                    Text(loc_add_widgets_text).foregroundColor(.white).allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding(10)
                    Spacer()
                    Button(action: { self.presentationMode.wrappedValue.dismiss() } )
                    {
                        Text(loc_go)
                    }.customButton()
                }.padding()
            }
        }
        .background(Color.prime)
        .edgesIgnoringSafeArea(.all)
    }
}
