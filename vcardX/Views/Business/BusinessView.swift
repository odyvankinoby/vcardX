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
    // Images
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    @Binding var edit: Bool
  
    var body: some View {
        VStack {
            NameView(settings: settings)
            CompanyView(settings: settings)
            PhoneBusinessView(settings: settings)
            EmailBusinessView(settings: settings)
            WwwBusinessView(settings: settings)
            AddressBusinessView(settings: settings)
        }.padding(.bottom, 50)
    }
}

struct CompanyView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_company).foregroundColor(.prime).bold()
                Text(loc_company).font(.caption2).foregroundColor(.prime)
                TextField(loc_company, text: $settings.company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.organizationName)
                    .keyboardType(.default)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_position).font(.caption2).foregroundColor(.prime)
                TextField(loc_position, text: $settings.position)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.organizationName)
                    .keyboardType(.default)
                    .font(.headline).foregroundColor(.prime)
            
        }.padding(.bottom, 10)
    }
}

struct PhoneBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_phone).foregroundColor(.prime).bold()
                Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                TextField(loc_mobile, text: $settings.mobileBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .keyboardType(.namePhonePad)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_landline).font(.caption2).foregroundColor(.prime)
                TextField(loc_landline, text: $settings.landlineBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.telephoneNumber)
                    .keyboardType(.namePhonePad)
                    .font(.headline).foregroundColor(.prime)
            
        }.padding(.bottom, 10)
    }
}

struct EmailBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_email).foregroundColor(.prime).bold()
                Text(loc_email_business).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_business, text: $settings.emailBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                TextField(loc_email_other, text: $settings.emailBusinessOther)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .font(.headline).foregroundColor(.prime)
            
        }.padding(.bottom, 10)
    }
}

struct WwwBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_www).foregroundColor(.prime).bold()
                Text(loc_www).font(.caption2).foregroundColor(.prime)
                TextField(loc_www, text: $settings.wwwBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.URL)
                    .keyboardType(.URL)
                    .font(.headline).foregroundColor(.prime)
            
        }.padding(.bottom, 10)
    }
}

struct AddressBusinessView: View {
    
    @ObservedObject var settings: UserSettings
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_address).foregroundColor(.prime).bold()
                Group {
                Text(loc_street).font(.caption2).foregroundColor(.prime)
                TextField(loc_street, text: $settings.street1Business)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.streetAddressLine1)
                    .keyboardType(.default)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                }
                Group {
                Text(loc_zip).font(.caption2).foregroundColor(.prime)
                TextField(loc_zip, text: $settings.zipBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.postalCode)
                    .keyboardType(.numberPad)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                Text(loc_city).font(.caption2).foregroundColor(.prime)
                TextField(loc_city, text: $settings.cityBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.addressCity)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .font(.headline).foregroundColor(.prime)
                Divider()
                }
                Text(loc_country).font(.caption2).foregroundColor(.prime)
                TextField(loc_country, text: $settings.countryBusiness)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.countryName)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .font(.headline).foregroundColor(.prime)
            
        }.padding(.bottom, 10)
    }
}
