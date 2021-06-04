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

        NameView(settings: settings)
             
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_company).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))

                VStack(alignment: .leading) {
                    Text(loc_company).font(.caption2).foregroundColor(.prime)
                    TextField(loc_company, text: $settings.company)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10)
                Divider()
                VStack(alignment: .leading) {
                    Text(loc_position).font(.caption2).foregroundColor(.prime)
                    TextField(loc_position, text: $settings.position)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 10)
                
            }
             .cornerRadius(10)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_phone).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))

                VStack(alignment: .leading) {
                    Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                    TextField(loc_mobile, text: $settings.mobileBusiness)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10)
                Divider()
                VStack(alignment: .leading) {
                    Text(loc_landline).font(.caption2).foregroundColor(.prime)
                    TextField(loc_landline, text: $settings.landlineBusiness)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 10)
                
            }
             .cornerRadius(10)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            
          
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_email).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))

                VStack(alignment: .leading) {
                    Text(loc_email_business).font(.caption2).foregroundColor(.prime)
                    TextField(loc_email_business, text: $settings.emailBusiness)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10)
                Divider()
                VStack(alignment: .leading) {
                    Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                    TextField(loc_email_other, text: $settings.emailOther)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 10)
                
            }
             .cornerRadius(10)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(loc_www).foregroundColor(.white).font(.headline).padding(.all, 10)
                    Spacer()
                }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))

               
                VStack(alignment: .leading) {
                    Text(loc_www).font(.caption2).foregroundColor(.prime)
                    TextField(loc_www, text: $settings.wwwBusiness)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.organizationName)
                        .font(.headline).foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 10)
                
            }
             .cornerRadius(10)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
            .padding(.bottom, 50)
            
           
        
        
    }
}


struct NameView: View {
    
    @ObservedObject var settings: UserSettings

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(loc_name).foregroundColor(.white).font(.headline).padding(.all, 10)
                Spacer()
            }.background(RoundedCorners(color: Color.prime, tl: 10, tr: 10, bl: 0, br: 0))

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
            }.padding(.leading, 10).padding(.trailing, 10)
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
            }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 10)
        }
         .cornerRadius(10)
         .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.5), lineWidth: 0.5))
    }
}
