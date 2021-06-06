//
//  AboutView.swift
//  vcardX
//
//  Created by Nicolas Ott on 02.06.21.
//


import SwiftUI
import UIKit
import MessageUI
import WebKit
import Foundation

struct GDPRView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical) {
                VStack {
                    Text(loc_gdpr_header)
                        .font(.title2).bold().foregroundColor(.white).padding(10)
                    Text(loc_gdpr_subheader).bold().font(.headline).foregroundColor(.white).padding(5)
                    Text(loc_gdpr_lastupdated).font(.subheadline).foregroundColor(.white).padding(5)
                    Text(loc_gdpr_text).foregroundColor(.white).padding(.bottom, 50)
                }.padding(10)
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .accentColor(Color.primeInverted)
            .background(Color.primeInverted)
        }.navigationBarTitle(loc_gdpr, displayMode: .automatic).allowsTightening(true)
    }
}

struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["mail@nicolasott.de"])
        vc.setSubject("vcardX Support")
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}

struct AboutvCardXView: View {
    
    //@ObservedObject var settings: UserSettings
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center) {
                    Image("AppIcon_dark")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .padding(.all, 10)
                        .frame(alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("vcardX").font(.headline)
                        Text("Your vCards at hand!").font(.subheadline)
                        Text("Version \(getCurrentAppBuildVersionString())").font(.subheadline)
                    }.padding()
                    Spacer()
                    
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(alignment: .center) {
                    Image(systemName: "c.circle")
                        .font(.largeTitle)
                        .frame(width: 64, height: 64)
                        .padding(.all, 10)
                        .frame(alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("Copyright")
                            .font(.caption)
                        Text("2021 Nicolas Ott").fontWeight(.semibold)
                    }.padding()
                    Spacer()
                }
                HStack(alignment: .center) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                        .frame(width: 64, height: 64)
                        .padding(.all, 10)
                        .frame(alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("Website")
                            .font(.caption)
                        Text("www.nicolasott.de").fontWeight(.semibold)
                    }.padding()
                    Spacer()
                }
                HStack(alignment: .center) {
                    Image(systemName: "at")
                        .font(.largeTitle)
                        .frame(width: 64, height: 64)
                        .padding(.all, 10)
                        .frame(alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("EMail")
                            .font(.caption)
                        Text("mail@nicolasott.de").fontWeight(.semibold)
                    }.padding()
                    Spacer()
                }
                
            }.padding(.horizontal, 10)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                
                Text(loc_madewithlove).font(.footnote)
            }
            .padding()
            .padding(.bottom, 25)
            .frame(maxWidth: .infinity)
            
        }.edgesIgnoringSafeArea(.bottom)
        .accentColor(Color.primeInverted)
        .background(Color.primeInverted)
        .navigationBarTitle(loc_about, displayMode: .automatic).allowsTightening(true)
    }
    
    
    func getCurrentAppBuildVersionString() -> String {
        let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        let buildString = "\(versionNumber).\(buildNumber)"
        return String(buildString)
    }
}

