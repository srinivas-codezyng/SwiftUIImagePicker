//
//  ContentView.swift
//  Shared
//
//  Created by Srinivas Prabhu on 11/07/20.
//

import SwiftUI

struct ContentView: View {
    @State private var image:Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack{
            image?.resizable()
                .scaledToFit()
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker,onDismiss: loadImage){
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage()  {
        guard let inputImage = inputImage else { return  }
        image  = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
