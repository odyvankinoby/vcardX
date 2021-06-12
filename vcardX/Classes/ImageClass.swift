//
//  ImageClass.swift
//  vcardX
//
//  Created by Nicolas Ott on 11.06.21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
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
            parent.image = uiImage
            UserDefaults.standard.set(uiImage.pngData(), forKey: parent.imageKey)
            UserDefaults.standard.set(true, forKey: parent.isSetKey)
        } else if let uiImage = info[.originalImage] as? UIImage {
            parent.image = uiImage
            UserDefaults.standard.set(uiImage.pngData(), forKey: parent.imageKey)
            UserDefaults.standard.set(true, forKey: parent.isSetKey)
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}

extension CIImage {

    /// Combines the current image with the given image centered.
    func combined(with image: CIImage) -> CIImage? {
        guard let combinedFilter = CIFilter(name: "CISourceOverCompositing") else { return nil }
        let centerTransform = CGAffineTransform(translationX: extent.midX - (image.extent.size.width / 2), y: extent.midY - (image.extent.size.height / 2))
        combinedFilter.setValue(image.transformed(by: centerTransform), forKey: "inputImage")
        combinedFilter.setValue(self, forKey: "inputBackgroundImage")
        return combinedFilter.outputImage!
    }
}

