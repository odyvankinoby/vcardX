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




struct SettingsListInstaIcon: View {
    var body: some View {
        Image("Instagram")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(6)
            .frame(width: 20, height: 20)
            .padding(.all,2)
    }
}

struct SettingsListTwitterIcon: View {
    var body: some View {
        Image("Twitter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(6)
            .frame(width: 20, height: 20)
            .padding(.all,2)
    }
}
