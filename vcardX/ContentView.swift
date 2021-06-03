//
//  ContentView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @ObservedObject var settings: UserSettings
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State var selector: Int = 0

    @State private var groupBusiness = false
    @State private var groupPrivate = false
    @State private var editMode = false
    @State private var showSheet = false
    
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
                    
                    DisclosureGroup(
                        isExpanded: $groupBusiness,
                        content: {
                            Divider()
                            HStack {
                            VStack(alignment: .leading) {
                                Text(loc_firstname).font(.caption)
                                TextField(loc_firstname, text: $settings.pFirstName)
                                    .textContentType(.name)
                                    .font(.headline)
                                    //.padding(.horizontal)
                                    //.background(Color("prime").opacity(0.5)).padding(5)
                                }
                                VStack(alignment: .leading) {
                                    Text(loc_lastname).font(.caption)
                                    TextField(loc_lastname, text: $settings.pLastName)
                                        .textContentType(.name)
                                        .font(.headline)
                                        //.padding(.horizontal)
                                        //.background(Color("prime").opacity(0.5)).padding(5)
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(loc_mobile).font(.caption)
                                TextField(loc_mobile, text: $settings.pMobile)
                                    .textContentType(.telephoneNumber)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_landline).font(.caption)
                                TextField(loc_landline, text: $settings.pLandline)
                                    .textContentType(.telephoneNumber)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_email).font(.caption)
                                TextField(loc_email, text: $settings.pMail)
                                    .textContentType(.emailAddress)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_www).font(.caption)
                                TextField(loc_www, text: $settings.pWww)
                                    .textContentType(.URL)
                                    .font(.headline)
                            }
                           
                        },
                        label: {
                            Text(loc_business_data)
                                .foregroundColor(.prime)
                                .font(.headline)
                        })
                        .accentColor(.prime)
                        .padding()

                    
                    Image(uiImage: generateQRCode(from: "\(settings.pFirstName)\n\(settings.pWww)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    Spacer()
                }
                else if selector == 1 {
                    
                    DisclosureGroup(
                        isExpanded: $groupPrivate,
                        content: {
                            Divider()
                            HStack {
                            VStack(alignment: .leading) {
                                Text(loc_firstname).font(.caption)
                                TextField(loc_firstname, text: $settings.pFirstName)
                                    .textContentType(.name)
                                    .font(.headline)
                                    //.padding(.horizontal)
                                    //.background(Color("prime").opacity(0.5)).padding(5)
                                }
                                VStack(alignment: .leading) {
                                    Text(loc_lastname).font(.caption)
                                    TextField(loc_lastname, text: $settings.pLastName)
                                        .textContentType(.name)
                                        .font(.headline)
                                        //.padding(.horizontal)
                                        //.background(Color("prime").opacity(0.5)).padding(5)
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(loc_mobile).font(.caption)
                                TextField(loc_mobile, text: $settings.pMobile)
                                    .textContentType(.telephoneNumber)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_landline).font(.caption)
                                TextField(loc_landline, text: $settings.pLandline)
                                    .textContentType(.telephoneNumber)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_email).font(.caption)
                                TextField(loc_email, text: $settings.pMail)
                                    .textContentType(.emailAddress)
                                    .font(.headline)
                            }
                            VStack(alignment: .leading) {
                                Text(loc_www).font(.caption)
                                TextField(loc_www, text: $settings.pWww)
                                    .textContentType(.URL)
                                    .font(.headline)
                            }
                           
                        },
                        label: {
                            Text(loc_private_data)
                                .foregroundColor(.prime)
                                .font(.headline)
                        })
                        .accentColor(.prime)
                        .padding()

                    
                    Image(uiImage: generateQRCode(from: "\(settings.pFirstName)\n\(settings.pWww)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    Spacer()
                    
                }
            }
            .background(Color.primeInverted)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            self.showSheet.toggle()
                        }) {
                            Image(systemName: "gearshape").foregroundColor(Color.primeInverted)

                        }
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            self.edit()
                        }) {
                            Image(systemName: "pencil.tip.crop.circle")
                                .foregroundColor(Color.primeInverted)
                        }
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                SettingsView(settings: settings).accentColor(Color.primeInverted)
                })
            .edgesIgnoringSafeArea(.bottom)
            .accentColor(Color.primeInverted)
            .navigationBarTitle(loc_vcard, displayMode: .automatic).allowsTightening(true)
        }.accentColor(Color.primeInverted)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
    
    func edit() {
        self.editMode.toggle()
        self.groupPrivate = self.editMode
        self.groupBusiness = self.editMode
    }
}
