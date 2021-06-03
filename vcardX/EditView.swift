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

struct EditView: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var noMail = false
    
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
