//
//  ContentView.swift
//  InstaFilter
//
//  Created by Shubham Rawal on 26/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var image : Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                    
                     image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    // select an image
                }
                
                HStack {
                   Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        //change the filter
                    }
                    
                    Spacer()
                    
                    Button("Save Image") {
                        // save image
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
