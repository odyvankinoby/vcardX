//
//  SettingsView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//
import SwiftUI
import UIKit
import MessageUI
import WebKit
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
    func onAppear() {
        if !MFMailComposeViewController.canSendMail() {
            self.noMail = true
        }
    }
}
