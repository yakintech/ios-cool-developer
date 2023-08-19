//
//  PhotoGallery.swift
//  IOSCooLDeveloper
//
//  Created by Çağatay Yıldız on 19.08.2023.
//

import SwiftUI
import PhotosUI

struct PhotoGallery: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack{
            PhotosPicker("Select image", selection: $selectedItem, matching: .images)
            
            if let selectedImage {
                selectedImage
                               .resizable()
                               .scaledToFit()
                               .frame(width: 300, height: 300)

                       }
            
        }
        .onChange(of: selectedItem) { _ in
                   Task {
                       if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                           if let uiImage = UIImage(data: data) {
                               selectedImage = Image(uiImage: uiImage)
                               return
                           }
                       }

                       print("Failed")
                   }
               }
    }
}

struct PhotoGallery_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGallery()
    }
}
