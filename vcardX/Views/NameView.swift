//
//  NameView.swift
//  vcardX
//
//  Created by Nicolas Ott on 11.06.21.
//

import SwiftUI
import Foundation

struct NameView: View {
    
    @ObservedObject var settings: UserSettings
    // Images
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    @State var type: String
    // Image
    @State private var showingImagePicker = false
    @State var ImagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    
    @State var imageKey: String = ""
    @State var isSetKey: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(loc_image).bold()
                
                Spacer()
                
                Button(action: {
                    self.resetUserImage()
                }) {
                    Image(systemName: "person.crop.circle.badge.xmark")
                        .foregroundColor(.prime)
                }
                 .disabled(image==nil)
                
                Button(action: {
                    self.pickerInit()
                }) {
                    Image(systemName: "camera")
                        .foregroundColor(.prime)
                }.padding(.leading, 10).padding(.trailing, 10)
            }
            
            HStack {
                Spacer()
                if image != nil {
                    image?
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.prime.opacity(0.5), lineWidth: 1.5))
                        .shadow(radius: 5)
                        .frame(width: 150, height: 150)
                } else {
                    Image(systemName: "person.crop.rectangle")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 148, weight: .ultraLight))
                }
                Spacer()
            }.padding(.bottom, 10)
            
            Divider()
            
            Section(header: Text(loc_name).bold()) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(loc_firstname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_firstname, text: $settings.firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.givenName)
                            .keyboardType(.default)
                            .font(.headline).foregroundColor(.prime)
                    }
                    VStack(alignment: .leading) {
                        Text(loc_middlename).font(.caption2).foregroundColor(.prime)
                        TextField(loc_middlename, text: $settings.middleName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.middleName)
                            .keyboardType(.default)
                            .font(.headline).foregroundColor(.prime)
                    }
                }//.padding(.leading, 10).padding(.trailing, 10)
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text(loc_lastname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_lastname, text: $settings.lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.familyName)
                            .keyboardType(.default)
                            .font(.headline).foregroundColor(.prime)
                    }
                    VStack(alignment: .leading) {
                        Text(loc_nickname).font(.caption2).foregroundColor(.prime)
                        TextField(loc_nickname, text: $settings.nickName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.nickname)
                            .keyboardType(.default)
                            .font(.headline).foregroundColor(.prime)
                    }
                }
            }
        }
        .onAppear {
            setKeys()
            if image == nil {
                self.loadImageFromUserDefault(key: self.imageKey)
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage,
                        imageKey: $imageKey,
                        isSetKey: $isSetKey,
                        ImagePickerSource: self.ImagePickerSource)
        }
        .padding(.bottom, 10)
    }

    func pickerInit() {
        self.showingImagePicker = true
        self.ImagePickerSource = .photoLibrary
    }
    
    func setKeys() {
        // Get Images
        if type == "p" {
            imageKey = "imgPrivate"
            isSetKey = "imgPrivateSet"
        }
        // Get Images
        if type == "b" {
            imageKey = "imgBusiness"
            isSetKey = "imgBusinessSet"
        }
    }
    
    func resetUserImage() {
        image = nil
        //settings.pcImageSet = false
        //settings.bcImageSet = false
    }
    
    func loadImage() {
        loadImageFromUserDefault(key: imageKey)
    }
    
    func loadImageFromUserDefault(key: String) {
        guard let imageData = UserDefaults.standard.object(forKey: key) as? Data else { return }
        inputImage = UIImage(data: imageData)
        image = Image(uiImage: inputImage!)
    }
    
}
