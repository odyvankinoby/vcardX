//
//  GenericViews.swift
//  Header
//  NameView
//  ProfileImage
//
//  vcardX
//
//  Created by Nicolas Ott on 11.06.21.
//

import SwiftUI
import Foundation


struct Header: View {
    var body: some View {
        GeometryReader { (geometry : GeometryProxy) in
            Rectangle()
                .frame(width: geometry.size.width)
        }
    }
}

struct NameView: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(loc_name).foregroundColor(.prime).bold()
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
            }
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
        }.padding(.bottom, 10)
    }
}


struct ProfileImage: View {
    
    @ObservedObject var settings: UserSettings
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    @State var type: String
    // Image
    @State private var showingImagePicker = false
    @State var ImagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    
    @State var imageKey: String = ""
    @State var isSetKey: String = ""
    @Binding var edit: Bool
    
    var body: some View {
            HStack(alignment: .top) {
                Spacer()
                if edit {
                    
                    NavButton(action: self.resetUserImage, image: "person.crop.circle.badge.xmark", disabled: image == nil)
                    }
                ZStack {
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle()
                                        .stroke(Color.white, lineWidth: edit ? 2 : 4)
                                        .frame(width: edit ? 100 : 200, height: edit ? 100 : 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                            .frame(width: edit ? 100 : 200, height: edit ? 100 : 200, alignment: .center)
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            //.scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle()
                                        .stroke(Color.white, lineWidth: edit ? 2 : 4)
                                        .frame(width: edit ? 100 : 200, height: edit ? 100 : 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                            .frame(width: edit ? 100 : 200, height: edit ? 100 : 200, alignment: .center)
                            .shadow(radius: 10)
                    }
                }
                if edit {
                
                    NavButton(action: self.pickerInit, image: "camera", disabled: false)
                    
                }
                Spacer()
            }
            .onAppear {
                setKeys()
                if image != nil {
                    self.loadImageFromUserDefault(key: self.imageKey)
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(uiImage: self.$inputImage,
                            imageKey: $imageKey,
                            isSetKey: $isSetKey,
                            ImagePickerSource: self.ImagePickerSource)
            }

    }

    func pickerInit() {
        self.showingImagePicker = true
        self.ImagePickerSource = .photoLibrary
    }
    
    func setKeys() {
        // Get Images
        if type == "p" {
            imageKey = "userImagePrivate"
            isSetKey = "userImagePrivateSet"
        }
        // Get Images
        if type == "b" {
            imageKey = "userImageBusiness"
            isSetKey = "userImageBusinessSet"
        }
    }
    
    func resetUserImage() {
        if type == "p" {
            settings.userImagePrivateSet = false
            settings.userImagePrivate = Data()
        }
        // Get Images
        if type == "b" {
            settings.userImageBusinessSet = false
            settings.userImageBusiness = Data()
        }
        image = nil
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

