//
//  ImagePicker.swift
//  InstaFilter
//
//  Created by Shubham Rawal on 26/08/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var image : UIImage?
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        
        var parent : ImagePicker
        
        init(_ parent : ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            //if the results array is empty, the user probably pressed the cancel button, return.
            guard let provider = results.first?.itemProvider else { return }
            
            //if we are here, we need to check if the results array canLoad a UIImage for us to display.
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        //this is the actual thing that gets the images for us
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
