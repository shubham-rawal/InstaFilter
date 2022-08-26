//
//  ContentView.swift
//  InstaFilter
//
//  Created by Shubham Rawal on 26/08/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image : Image?
    @State private var amount = 1.0
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            
            Slider(value: $amount, in: 0...10)
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "SWAR") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage

        
        let inputKeys = currentFilter.inputKeys
        
        //changing the filter parameters dynamically
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 100, forKey: kCIInputRadiusKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImg = UIImage(cgImage: cgimg)
            
            image = Image(uiImage: uiImg)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
