//
//  ContentView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @Binding var tabSelected: Int
    @ObservedObject var settings: UserSettings
    
    @State private var name = "Nicolas Ott"
    @State private var emailAddress = "mail@nicolasott.de"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State var selector: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker(selection: $selector, label: Text("")) {
                        Text("Business").tag(0)
                        Text("Private").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).labelsHidden()
                }.padding(10)
            
            
                
                if selector == 0 {
                    
                    
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .font(.title)
                        .padding(.horizontal)
                    
                    TextField("Email address", text: $emailAddress)
                        .textContentType(.emailAddress)
                        .font(.title)
                        .padding([.horizontal, .bottom])
                    Spacer()
                    Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                }
                else if selector == 1 {
                    
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .font(.title)
                        .padding(.horizontal)
                    
                    TextField("Email address", text: $emailAddress)
                        .textContentType(.emailAddress)
                        .font(.title)
                        .padding([.horizontal, .bottom])
                    Spacer()
                    Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                Spacer()
                Text("Handmade with ❤️ in Munich.")
                    .font(.caption)
                    .padding([.horizontal, .bottom])
               
                
            }
            .background(Color("primeInverted"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            self.tabSelected = 2
                        }) {
                            Image(systemName: "gearshape").foregroundColor(Color("primeInverted"))
                        }
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            self.edit()
                        }) {
                            Image(systemName: "pencil.tip.crop.circle")
                                .foregroundColor(Color("primeInverted"))
                        }
                    }
                }
            }
            .navigationBarTitle("Your vCard", displayMode: .automatic).allowsTightening(true)
        }
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
        
    }
}
