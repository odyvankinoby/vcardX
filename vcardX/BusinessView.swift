//
//  BusinessView.swift
//  vcardX
//
//  Created by Nicolas Ott on 03.06.21.
//
import SwiftUI
import Foundation

struct BusinessView: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            NameView(settings: settings)
            CompanyView(settings: settings)
            PhoneBusinessView(settings: settings)
            EmailBusinessView(settings: settings)
            WwwBusinessView(settings: settings)
            
        }.padding(.bottom, 50)
    }
}

struct BusinessPreview: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(settings.firstName) \(settings.lastName)")
                .foregroundColor(.prime)
                .font(.headline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            HStack {
                if settings.position != "" {
                    Text("\(settings.position)")
                        .foregroundColor(.prime)
                        .font(.subheadline)
                        .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                if settings.position != "" && settings.company != "" {
                    Text("@").foregroundColor(.prime)
                        .font(.subheadline)
                        .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                if settings.company != "" {
                    Text("\(settings.company)").foregroundColor(.prime)
                        .font(.subheadline)
                        .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
            
            Divider()
            Text("\(settings.mobileBusiness)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text("\(settings.emailBusiness)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text("\(settings.wwwBusiness)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }.padding()
    }
}

struct NameView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_name).bold()) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(loc_firstname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_firstname, text: $settings.firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.givenName)
                            .font(.headline).foregroundColor(.prime)
                    }
                    VStack(alignment: .leading) {
                        Text(loc_middlename).font(.caption2).foregroundColor(.prime)
                        TextField(loc_middlename, text: $settings.middleName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.middleName)
                            .font(.headline).foregroundColor(.prime)
                    }
                }//.padding(.leading, 10).padding(.trailing, 10)
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text(loc_lastname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_lastname, text: $settings.lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.familyName)
                            .font(.headline).foregroundColor(.prime)
                    }
                    VStack(alignment: .leading) {
                        Text(loc_nickname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_nickname, text: $settings.nickName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.nickname)
                            .font(.headline).foregroundColor(.prime)
                    }
                }
            }
        }.padding(.bottom, 10)
    }
}

struct CompanyView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_company).bold()) {
                Text(loc_company).font(.caption2).foregroundColor(.prime)
                TextField(loc_company, text: $settings.company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.organizationName)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_position).font(.caption2).foregroundColor(.prime)
                TextField(loc_position, text: $settings.position)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.organizationName)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct PhoneBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_phone).bold()) {
                Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                TextField(loc_mobile, text: $settings.mobileBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_landline).font(.caption2).foregroundColor(.prime)
                TextField(loc_landline, text: $settings.landlineBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct EmailBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_email).bold()) {
                Text(loc_email_business).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_business, text: $settings.emailBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_other, text: $settings.emailBusinessOther)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct WwwBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_www).bold()) {
                Text(loc_www).font(.caption2).foregroundColor(.prime)
                TextField(loc_www, text: $settings.wwwBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.URL)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}
