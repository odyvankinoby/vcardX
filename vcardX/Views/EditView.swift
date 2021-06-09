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
    @State var type: String
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var noMail = false
    
    var body: some View {
        //VStack {
            ScrollView {
                if type == "b" {
                    BusinessView(settings: settings)
                } else {
                    PrivateView(settings: settings)
                }
                
           // }
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
