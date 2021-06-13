//
//  ImageClass.swift
//  vcardX
//
//  Created by Nicolas Ott on 11.06.21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
   
    @Binding var uiImage: UIImage?
    @Binding var image: Image?
    @Binding var imageKey: String
    @Binding var isSetKey: String
    @State var ImagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType =  self.ImagePickerSource
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let uiImage = info[.editedImage] as? UIImage {
            parent.uiImage = uiImage
            parent.image = Image(uiImage: uiImage)
            UserDefaults.standard.set(uiImage.pngData(), forKey: parent.imageKey)
            UserDefaults.standard.set(true, forKey: parent.isSetKey)
        } else if let uiImage = info[.originalImage] as? UIImage {
            parent.uiImage = uiImage
            parent.image = Image(uiImage: uiImage)
            UserDefaults.standard.set(uiImage.pngData(), forKey: parent.imageKey)
            UserDefaults.standard.set(true, forKey: parent.isSetKey)
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}
