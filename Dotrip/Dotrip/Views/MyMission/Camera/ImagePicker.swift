//
//  ImagePicker.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isVisible: Bool
    @Binding var image:Image?
    var sourcetype:Int
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(isvisible: $isVisible, image: $image)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.sourceType = sourcetype == 1 ?  .photoLibrary : .camera
        
        vc.delegate = context.coordinator
        
        return vc
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var isvisible: Bool
        @Binding var image: Image?
        
        init(isvisible: Binding<Bool>, image: Binding<Image?>) {
            _isvisible = isvisible
            _image = image
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
          isvisible = false
        }
       
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isvisible = false
        }
        
    }
}


