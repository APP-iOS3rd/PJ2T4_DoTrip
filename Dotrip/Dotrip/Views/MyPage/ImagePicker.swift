//
//  ImagePicker.swift
//  Dotrip
//
//  Created by 이현호 on 12/11/23.
//

import PhotosUI
import SwiftUI

var preseletedAssetIdentifiers = [String]()

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) private var dismiss
    let config: PHPickerConfiguration
    let completion: (_ seletedImages: [PHPickerResult]) -> Void
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            preseletedAssetIdentifiers = results.map(\.assetIdentifier!)
            
            self.parent.completion(results)
            parent.dismiss()
        }
    }
}
