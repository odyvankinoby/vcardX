//
//  PrivateView.swift
//  vcardX
//
//  Created by Nicolas Ott on 04.06.21.
//

import SwiftUI
import Foundation

struct PrivateView: View {
    
    @ObservedObject var settings: UserSettings
    // Images
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    
    var body: some View {
        VStack {
            NameView(settings: settings, image: $image, inputImage: $inputImage, type: "p")
            PhoneView(settings: settings)
            EmailView(settings: settings)
            WwwView(settings: settings)
            AddressPrivateView(settings: settings)
        }.padding(.bottom, 50)
    }
}

struct PrivatePreview: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(settings.firstName) \(settings.lastName)")
                .foregroundColor(.prime)
                .font(.headline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Divider()
            Text("\(settings.mobilePrivate)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text("\(settings.emailPrivate)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text("\(settings.wwwPrivate)").foregroundColor(.prime)
                .font(.subheadline)
                .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }.padding()
    }
}

struct PhoneView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_phone).bold()) {
                Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                TextField(loc_mobile, text: $settings.mobilePrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .keyboardType(.namePhonePad)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_landline).font(.caption2).foregroundColor(.prime)
                TextField(loc_landline, text: $settings.landlinePrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .keyboardType(.namePhonePad)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct EmailView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_email).bold()) {
                Text(loc_email_private).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_private, text: $settings.emailPrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_other, text: $settings.emailPrivateOther)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct WwwView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_www).bold()) {
                Text(loc_www).font(.caption2).foregroundColor(.prime)
                TextField(loc_www, text: $settings.wwwPrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.URL)
                    .keyboardType(.URL)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

struct AddressPrivateView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section(header: Text(loc_address).bold()) {
                Group {
                Text(loc_street).font(.caption2).foregroundColor(.prime)
                TextField(loc_street, text: $settings.street1Private)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.streetAddressLine1)
                    .keyboardType(.default)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_street2).font(.caption2).foregroundColor(.prime)
                TextField(loc_street2, text: $settings.street2Private)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.streetAddressLine2)
                    .keyboardType(.default)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                }
                Group {
                Text(loc_zip).font(.caption2).foregroundColor(.prime)
                TextField(loc_zip, text: $settings.zipPrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.postalCode)
                    .keyboardType(.numberPad)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_city).font(.caption2).foregroundColor(.prime)
                TextField(loc_city, text: $settings.cityPrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.addressCity)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                }
                Text(loc_country).font(.caption2).foregroundColor(.prime)
                TextField(loc_country, text: $settings.countryPrivate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.countryName)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .font(.headline).foregroundColor(.prime)
            }
        }.padding(.bottom, 10)
    }
}

