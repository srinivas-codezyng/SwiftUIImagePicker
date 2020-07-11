//
//  ImagePicker.swift
//  iOS
//
//  Created by Srinivas Prabhu on 11/07/20.
//

import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var image:UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator :NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        var parent : ImagePicker
        
        init(_ parent : ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiimage = info[.originalImage] as? UIImage {
                parent.image = uiimage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
