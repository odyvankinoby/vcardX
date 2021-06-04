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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_settings).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))
                
                HStack {
                   
                    Text("Twitter").frame(alignment: .leading).foregroundColor(.prime)
                    Spacer()
                   
                }.padding(.leading, 10)
                Divider()
                HStack {
                   
                    Text("Insta").frame(alignment: .leading).foregroundColor(.prime)
                    Spacer()
                   
                }.padding(.leading, 10)
                Divider()
            }
             .cornerRadius(10)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
             .padding(10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_support).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))
                
                HStack {
                    NavigationLink(destination: MailView(result: self.$result)) {
                        HStack {
                            
                            Text(loc_feedback).frame(alignment: .leading).foregroundColor(noMail ? .gray : .prime)
                            Spacer()
                        }
                    }.padding(.leading, 10)
                    .disabled(!MFMailComposeViewController.canSendMail())
                }
                Divider()
                HStack {
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
                    Text("Twitter").frame(alignment: .leading).foregroundColor(.prime)
                    Spacer()
                }.padding(.leading, 10).padding(.bottom, 10)
                .frame(alignment: .leading).onTapGesture(perform: {
                    if let url = URL(string: "https://twitter.com/trax_tracker") {
                        UIApplication.shared.open(url)
                    }
                })
            }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            .padding(10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_about).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))
                
                HStack {
                    NavigationLink(destination: AboutvCardXView()) {
                        HStack {
                            Text(loc_about).frame(alignment: .leading).foregroundColor(.prime)
                            Spacer()
                        }
                    }.padding(.leading, 10)
                    .disabled(!MFMailComposeViewController.canSendMail())
                }
                Divider()
                HStack {
                    NavigationLink(destination: GDPRView()) {
                        HStack {
                            Text(loc_gdpr).frame(alignment: .leading).foregroundColor(.prime)
                            Spacer()
                        }
                    }.padding(.leading, 10)
                    .disabled(!MFMailComposeViewController.canSendMail())
                }
            }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            .padding(10)
            
Spacer()
            Text(loc_madewithlove)
            .font(.caption)
            .padding([.horizontal, .bottom])
        }
        .onAppear(perform: onAppear)
        .edgesIgnoringSafeArea(.bottom)
        .accentColor(Color.primeInverted)
        .background(Color.primeInverted)
        .navigationBarTitle(loc_settings, displayMode: .automatic).allowsTightening(true)
        
        
    }
    func onAppear() {
        if !MFMailComposeViewController.canSendMail() {
            self.noMail = true
        }
    }
}

 

