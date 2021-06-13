//
//  EditView.swift
//  vcardX
//
//  Created by Nicolas Ott on 03.06.21.
//

import SwiftUI
import UIKit
import MessageUI
import WebKit
import Foundation

struct ContactView: View {
    
    @ObservedObject var settings: UserSettings
    @State var type: String
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var noMail = false
    
    @State var edit = false
    
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            VStack {
                Header()
                    .foregroundColor(Color.prime.opacity(1.0))
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 150)
                ProfileImage(settings: settings, image: $image, inputImage: $inputImage, type: type, edit: $edit)
                    .offset(y: -120)
                    .padding(.bottom, -130)
                if !edit {
                    VStack {
                        HStack {
                            Text(settings.firstName)
                                .bold()
                                .font(.title)
                                .foregroundColor(.prime)
                                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            if settings.middleName != "" {
                                Text(settings.middleName)
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.prime)
                                    .allowsTightening(true)
                            }
                            if settings.nickName != "" {
                                Text("\"\(settings.nickName)\"")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.prime)
                                    .allowsTightening(true)
                            }
                            Text(settings.lastName)
                                .bold()
                                .font(.title)
                                .foregroundColor(.prime)
                                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        if type == "b" {
                            Text("\(settings.position)")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.prime)
                                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Text("\(settings.company)")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.prime)
                                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        Divider()
                        
                    }.padding()
                    ScrollView {
                        if type == "b" {
                            BusinessData(settings: settings)
                        } else {
                            PrivateData(settings: settings)
                        }
                    }
                }  else {
                    ScrollView {
                        if type == "b" {
                            BusinessView(settings: settings, image: $image, inputImage: $inputImage, edit: $edit)
                                .onDisappear(perform: {
                                    WidgetUpdaterClass(settings: settings).updateValues()
                                })
                                .foregroundColor(Color.primeInverted.opacity(1.0))
                                .padding()
                        } else {
                            PrivateView(settings: settings, image: $image, inputImage: $inputImage, edit: $edit)
                                .onDisappear(perform: {
                                    WidgetUpdaterClass(settings: settings).updateValues()
                                })
                                .foregroundColor(Color.primeInverted.opacity(1.0))
                                .padding()
                        }
                    }
                }
            }
            Spacer()
            Spacer()
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack {
                    Button(action: {
                        self.edit.toggle()
                    }) {
                        Image(systemName: edit ? "checkmark.circle" : "ellipsis.circle")
                            .foregroundColor(Color.primeInverted)
                    }
                }
            }
        }
        .modifier(AdaptsToKeyboard())
        .accentColor(Color.primeInverted)
        .background(Color.primeInverted)
        .edgesIgnoringSafeArea(.bottom)//.edgesIgnoringSafeArea(.top)
        .navigationBarTitle(type == "b" ? loc_business_data : loc_private_data, displayMode: .automatic).allowsTightening(true)
    }
}
