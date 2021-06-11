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
    @State var type: String
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var noMail = false
    
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        //VStack {
            ScrollView {
                if type == "b" {
                    BusinessView(settings: settings, image: $image, inputImage: $inputImage)
                } else {
                    PrivateView(settings: settings, image: $image, inputImage: $inputImage)
                }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack {
                    Button(action: {
                    
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Image(systemName: "checkmark.circle")
                        
                    }
                }
            }
        }
        .padding(10)
        .modifier(AdaptsToKeyboard())
        .accentColor(Color.primeInverted)
        .background(Color.primeInverted)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(type == "b" ? loc_business_data : loc_private_data, displayMode: .automatic).allowsTightening(true)
    }
}
