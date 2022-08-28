//
//  ImagePicker.swift
//  InstaFilter
//
//  Created by Shubham Rawal on 26/08/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        //this is the actual thing that gets the images for us
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
}
