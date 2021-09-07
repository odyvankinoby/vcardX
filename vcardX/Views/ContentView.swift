//
//  ContentView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI
import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import Contacts
import StoreKit

struct ContentView: View {
    
    @ObservedObject var settings: UserSettings
    @Environment (\.presentationMode) var presentationMode
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    let productIDs = [
        "de.nicolasott.vcardX.premium"
    ]
    @StateObject var storeManager = StoreManager()
    
    @State var selector: Int = 0
   
    @State private var showSheet = false
    @State var navSelected: Int? = nil
    @State private var setup = false
    @State private var update = false
    
    // Images
    @State var bcImage: Image? = nil
    @State var bcInputImage: UIImage?
    @State var pcImage: Image? = nil
    @State var pcInputImage: UIImage?
 
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker(selection: $selector, label: Text("")) {
                        if settings.vcards == "All" || settings.vcards == "Business" { Text(loc_business).tag(0) }
                        if settings.vcards == "All" || settings.vcards == "Private" { Text(loc_private).tag(1) }
                    }.pickerStyle(SegmentedPickerStyle()).labelsHidden()
                }.padding(10)
                
                if selector == 0 {
                    VStack(alignment: .center) {
                        Image(uiImage: generateQRCodeFromData(from: self.createBusinessContact()!, type: "business"))
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    BusinessPreview(settings: settings, image: $bcImage)
                    Spacer()
                } else if selector == 1 {
                    VStack(alignment: .center) {
                        Image(uiImage: generateQRCodeFromData(from: self.createPrivateContact()!, type: "pvt"))
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                    }
                    PrivatePreview(settings: settings, image: $pcImage)
                    Spacer()
                }
                NavigationLink(destination: ContactView(settings: settings, type: "b", image: $bcImage, inputImage: $bcInputImage)
                                .accentColor(Color.primeInverted)
                                .edgesIgnoringSafeArea(.bottom), tag: 1, selection: $navSelected)
                {
                    EmptyView()
                }.isDetailLink(false)
                
                NavigationLink(destination: ContactView(settings: settings, type: "p", image: $pcImage, inputImage: $pcInputImage)
                                .accentColor(Color.primeInverted)
                                .edgesIgnoringSafeArea(.bottom), tag: 2, selection: $navSelected)
                {
                    EmptyView()
                }.isDetailLink(false)
                
                NavigationLink(destination: SettingsView(settings: settings, selector: $selector, storeManager: storeManager).accentColor(Color.primeInverted)
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
        .sheet(isPresented: self.$showSheet) {
            if self.setup {
                SetupView(settings: settings)
            } else if self.update {
                UpdateView(settings: settings)
            }
        }
        .accentColor(Color.primeInverted).edgesIgnoringSafeArea(.bottom)
        .onAppear(perform: {
            onAppear()
            UITabBar.appearance().backgroundColor = UIColor.systemBackground
            UITabBar.appearance().isTranslucent = true
        })
    }
    
    
    func onAppear() {
        
        let createB = generateQRCodeFromData(from: self.createBusinessContact()!, type: "business")
        let createP = generateQRCodeFromData(from: self.createPrivateContact()!, type: "pvt")
        
        SKPaymentQueue.default().add(storeManager)
        storeManager.getProducts(productIDs: productIDs)
        //settings.purchased = true
        UserDefaults(suiteName: "group.de.nicolasott.vcardX")!.set(settings.purchased, forKey: "purchased")
        
        if settings.vcards == "All" {
            self.selector = 0
        } else if settings.vcards == "Business" {
            self.selector = 0
        } else {
            self.selector = 1
        }
       
        onStartUp()
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
        
        let address = CNMutablePostalAddress()
        address.street = settings.street1Business
        //address.street = settings.street2Business
        address.city = settings.cityBusiness
        address.postalCode = settings.zipBusiness
        address.country = settings.countryBusiness
        let labeledAddress = CNLabeledValue<CNPostalAddress>(label: CNLabelWork, value: address)
        
        contact.postalAddresses = [labeledAddress]
      
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
        
        let address = CNMutablePostalAddress()
        address.street = settings.street1Private
        //address.street = settings.street2Private
        address.city = settings.cityPrivate
        address.postalCode = settings.zipPrivate
        address.country = settings.countryPrivate
        let labeledAddress = CNLabeledValue<CNPostalAddress>(label: CNLabelHome, value: address)
        
        contact.postalAddresses = [labeledAddress]
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
    
        let contactData = try? CNContactVCardSerialization.data(with: [contact])
        return contactData
    }
    
    func generateQRCodeFromData(from data: Data, type: String) -> UIImage {
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                saveImageToUserDefaults(image: UIImage(cgImage: cgimg), type: type)
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
  
  
    func saveImageToUserDefaults(image: UIImage, type: String) {
        
        if type == "business" {
            UserDefaults.standard.set(image.pngData(), forKey: "qrImageBusiness")
            UserDefaults.standard.set(true, forKey: "imgBusinessSet")
        } else {
            UserDefaults.standard.set(image.pngData(), forKey: "qrImagePrivate")
            UserDefaults.standard.set(true, forKey: "imgPrivateSet")
        }
        WidgetUpdaterClass(settings: settings).updateValues()
    }

    func onStartUp() {
        // App launched before?
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
       
        let newVersion = getCurrentAppVersion()
        let newBuild = getCurrentAppBuildVersion()
        let newAppBuildString = getCurrentAppBuildVersionString()
        
        let savedVersion = settings.appVersion
        let savedBuild = settings.appBuild
       
        settings.appVersion = newVersion
        settings.appBuild = newBuild
        settings.appVersionString = newAppBuildString
      
        if launchedBefore {
            if savedVersion != newVersion || savedBuild != newBuild {
                self.update = true
                self.showSheet = true
            }
        } else {
            self.setup = true
            self.showSheet = true
        }

        
        // Get Images
        if settings.userImagePrivateSet == true {
            loadImageFromUserDefault(key: "userImagePrivate")
        }
        // Get Images
        if settings.userImageBusinessSet == true {
            loadImageFromUserDefault(key: "userImageBusiness")
        }
        
        WidgetUpdaterClass(settings: settings).updateValues()
        
    }
    
    func loadImageFromUserDefault(key: String) {
        guard let imageData = UserDefaults.standard.object(forKey: key) as? Data else { return }
        if key == "userImagePrivate" {
            pcInputImage = UIImage(data: imageData)
            pcImage = Image(uiImage: pcInputImage!)
        } else {
            bcInputImage = UIImage(data: imageData)
            bcImage = Image(uiImage: bcInputImage!)
        }
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return String(versionNumber)
    }
    
    func getCurrentAppBuildVersion() -> String {
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        return String(buildNumber)
    }
    
    func getCurrentAppBuildVersionString() -> String {
        let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        let buildString = "\(versionNumber) (\(buildNumber))"
        return String(buildString)
    }
}


