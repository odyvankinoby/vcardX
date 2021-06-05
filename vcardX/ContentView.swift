//
//  ContentView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI
import Foundation
import CoreImage.CIFilterBuiltins
import Contacts

struct ContentView: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State var selector: Int = 0
    
    @State private var groupBusiness = false
    @State private var groupPrivate = false
    @State private var showSheet = false
    @State var navSelected: Int? = nil
    @State var setup = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker(selection: $selector, label: Text("")) {
                        Text(loc_business).tag(0)
                        Text(loc_private).tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).labelsHidden()
                }.padding(10)
                
                if selector == 0 {
                    VStack(alignment: .center) {
                        Image(uiImage: generateQRCodeFromData(from: self.createBusinessContact()!))
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    BusinessPreview(settings: settings)
                    Spacer()
                } else if selector == 1 {
                    VStack(alignment: .center) {
                        Image(uiImage: generateQRCodeFromData(from: self.createPrivateContact()!))
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                    }
                    PrivatePreview(settings: settings)
                    Spacer()
                }
                NavigationLink(destination: EditView(settings: settings, type: "b").accentColor(Color.primeInverted)
                                .edgesIgnoringSafeArea(.bottom), tag: 1, selection: $navSelected)
                {
                    EmptyView()
                }.isDetailLink(false)
                NavigationLink(destination: EditView(settings: settings, type: "p").accentColor(Color.primeInverted)
                                .edgesIgnoringSafeArea(.bottom), tag: 2, selection: $navSelected)
                {
                    EmptyView()
                }.isDetailLink(false)
                NavigationLink(destination: SettingsView(settings: settings).accentColor(Color.primeInverted)
                                .edgesIgnoringSafeArea(.bottom), tag: 3, selection: $navSelected)
                {
                    EmptyView()
                }.isDetailLink(false)
                NavigationLink(destination: EmptyView())
                {
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            self.navSelected = 3
                        }) {
                            Image(systemName: "gearshape").foregroundColor(Color.primeInverted)
                            
                        }
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            if self.selector == 0 {
                                self.navSelected = 1
                            } else {
                                self.navSelected = 2
                            }
                        }) {
                            Image(systemName: "ellipsis.circle").foregroundColor(Color.primeInverted)
                        }
                    }
                }
            }
            .background(Color.primeInverted).edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(loc_vcard, displayMode: .automatic).allowsTightening(true)
        }
        .sheet(isPresented: self.$setup) {
           
                SetupView(settings: settings)
         
        }
        .accentColor(Color.primeInverted).edgesIgnoringSafeArea(.bottom)
        .onAppear(perform: {
            onAppear()
            //UITabBar.appearance().tintColor = UIColor(.textDark)
            UITabBar.appearance().backgroundColor = UIColor.systemBackground
            UITabBar.appearance().isTranslucent = true
            
        })
    }
    
    
    func onAppear() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if !launchedBefore { self.setup = true }
    }
    
    func createBusinessContact() -> Data? {
        
        let contact = CNMutableContact()
        contact.contactType = CNContactType.organization
        contact.givenName = settings.firstName
        contact.familyName = settings.lastName
        contact.middleName = settings.middleName
        contact.nickname = settings.nickName
        contact.organizationName = settings.company
        contact.jobTitle = settings.position
        contact.emailAddresses = [CNLabeledValue(label:CNLabelWork,value:NSString(string:settings.emailBusiness)),
                                  CNLabeledValue(label:CNLabelOther,value:NSString(string:settings.emailBusinessOther))]
        contact.phoneNumbers = [CNLabeledValue(
                                    label:CNLabelPhoneNumberMobile,
                                    value:CNPhoneNumber(stringValue:settings.mobileBusiness)),
                                CNLabeledValue(
                                    label:CNLabelPhoneNumberMain,
                                    value:CNPhoneNumber(stringValue:settings.landlineBusiness))]
        contact.urlAddresses = [CNLabeledValue(
                                    label:CNLabelURLAddressHomePage,
                                    value:NSString(string:settings.wwwBusiness))]
        // contact.imageData = NSData() as Data // The profile picture as a NSData object
        // contact.postalAddresses =
        // contact.birthday =
        let contactData = try? CNContactVCardSerialization.data(with: [contact])
        return contactData
    }
    
    func createPrivateContact() -> Data? {
        
        let contact = CNMutableContact()
        contact.contactType = CNContactType.person
        contact.givenName = settings.firstName
        contact.familyName = settings.lastName
        contact.middleName = settings.middleName
        contact.nickname = settings.nickName
        
        contact.emailAddresses = [CNLabeledValue(label:CNLabelHome,value:NSString(string:settings.emailPrivate)),
                                  CNLabeledValue(label:CNLabelOther,value:NSString(string:settings.emailPrivateOther))]
        contact.phoneNumbers = [CNLabeledValue(
                                    label:CNLabelPhoneNumberMobile,
                                    value:CNPhoneNumber(stringValue:settings.mobileBusiness)),
                                CNLabeledValue(
                                    label:CNLabelPhoneNumberMain,
                                    value:CNPhoneNumber(stringValue:settings.landlineBusiness))]
        contact.urlAddresses = [CNLabeledValue(
                                    label:CNLabelURLAddressHomePage,
                                    value:NSString(string:settings.wwwBusiness))]
        // contact.imageData = NSData() as Data // The profile picture as a NSData object
        // contact.postalAddresses =
        // contact.birthday =
        let contactData = try? CNContactVCardSerialization.data(with: [contact])
        return contactData
    }
    
    func generateQRCodeFromData(from data: Data) -> UIImage {
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func generateQRCodeFromString(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
