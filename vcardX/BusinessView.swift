/*
//
//  BusinessView.swift
//  vcardX
//
//  Created by Nicolas Ott on 03.06.21.
//
import SwiftUI
 import Foundation
struct SettingsView: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var noMail = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(loc_support)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                    Spacer()
                }
                Divider()
                NavigationLink(destination: MailView(result: self.$result)) {
                    HStack {
                        Image(systemName: "at.circle").foregroundColor(noMail ? .gray : .prime)
                        Text(loc_feedback).frame(alignment: .leading).foregroundColor(noMail ? .gray : .prime)
                        Spacer()
                    }
                }.padding(.leading, 10)
                .disabled(!MFMailComposeViewController.canSendMail())
                
                Divider()
                HStack {
                    Image(systemName: "paperplane.circle").foregroundColor(.prime)
                    Text(loc_contact).frame(alignment: .leading).foregroundColor(.prime)
                    Spacer()
                }.padding(.leading, 10)
                .frame(alignment: .leading).onTapGesture(perform: {
                    if let url = URL(string: "https://www.nicolasott.de/en/contact/") {
                        UIApplication.shared.open(url)
                    }
                })
                
                Divider()
                
                HStack {
                    SettingsListTwitterIcon().foregroundColor(.prime)
                    Text("Twitter").frame(alignment: .leading).foregroundColor(.prime)
                    Spacer()
                }.padding(.leading, 10).padding(.bottom, 10)
                .frame(alignment: .leading).onTapGesture(perform: {
                    if let url = URL(string: "https://twitter.com/nicolas_ott") {
                        UIApplication.shared.open(url)
                    }
                })
                
                
                
                Spacer()
                Text(loc_madewithlove)
                    .font(.caption)
                    .padding([.horizontal, .bottom])
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark.circle").foregroundColor(Color.primeInverted)
                        }
                    }
                }
                
            }
            .onAppear(perform: onAppear)
            .edgesIgnoringSafeArea(.bottom)
            .accentColor(Color.primeInverted)
            .background(Color.primeInverted)
            .navigationBarTitle(loc_settings, displayMode: .automatic).allowsTightening(true)
        }
    }
}

struct BusinessView: View {
    
    @ObservedObject var settings: UserSe
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Group {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(loc_firstname).font(.caption2).foregroundColor(.white)
                            TextField(loc_firstname, text: $settings.firstName)
                                .textContentType(.givenName)
                                .font(.headline).foregroundColor(.prime)
                        }
                        VStack(alignment: .leading) {
                            Text(loc_middlename).font(.caption2).foregroundColor(.white)
                            TextField(loc_middlename, text: $settings.middleName)
                                .textContentType(.middleName)
                                .font(.headline).foregroundColor(.prime)
                        }
                        
                    }
                    Divider()
                    HStack {
                        VStack(alignment: .leading) {
                            Text(loc_lastname).font(.caption2).foregroundColor(.white)
                            TextField(loc_lastname, text: $settings.lastName)
                                .textContentType(.familyName)
                                .font(.headline).foregroundColor(.prime)
                        }
                        VStack(alignment: .leading) {
                            Text(loc_nickname).font(.caption2).foregroundColor(.white)
                            TextField(loc_nickname, text: $settings.nickName)
                                .textContentType(.nickname)
                                .font(.headline).foregroundColor(.prime)
                        }
                    }
                    Divider()
                }
                
                
                Group {
                    Text(loc_company).font(.caption2).foregroundColor(.white)
                    TextField(loc_company, text: $settings.company)
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                    
                    Text(loc_position).font(.caption2).foregroundColor(.white)
                    TextField(loc_position, text: $settings.position)
                        .textContentType(.jobTitle)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                }
                Group {
                    Text(loc_mobile).font(.caption2).foregroundColor(.white)
                    TextField(loc_mobile, text: $settings.mobileBusiness)
                        .textContentType(.telephoneNumber)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                    
                    Text(loc_landline).font(.caption2).foregroundColor(.white)
                    TextField(loc_landline, text: $settings.landlineBusiness)
                        .textContentType(.telephoneNumber)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                }
                Group {
                    Text(loc_email_business).font(.caption2).foregroundColor(.white)
                    TextField(loc_email_business, text: $settings.emailBusiness)
                        .textContentType(.emailAddress)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                    Text(loc_email_other).font(.caption2).foregroundColor(.white)
                    TextField(loc_email_other, text: $settings.emailOther)
                        .textContentType(.emailAddress)
                        .font(.headline).foregroundColor(.prime)
                    Divider()
                    Text(loc_www).font(.caption2).foregroundColor(.white)
                    TextField(loc_www, text: $settings.wwwBusiness)
                        .textContentType(.URL)
                        .font(.headline).foregroundColor(.prime)
                }
                
            }
        }
        
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle").foregroundColor(Color.primeInverted)
                    }
                }
            }
        
        }
        .edgesIgnoringSafeArea(.bottom)
        .accentColor(Color.primeInverted)
        .background(Color.primeInverted)
        .navigationBarTitle(loc_business_data, displayMode: .automatic).allowsTightening(true)
    }
}

*/
