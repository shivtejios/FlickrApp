//
//  PhotoCellView.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import SwiftUI

struct PhotoCellView: View {
    let photo: Photo
    @State private var image: UIImage?
    
    var body: some View {
            if let image = image {
                Image(uiImage: image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                ProgressView()
                    .onAppear(perform: loadImage)
            }
        }
    
    private func loadImage() {
        Task {
            guard let imageURL = URL(string: photo.media["m"] ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(photo: Photo.defaultValue)
    }
}
