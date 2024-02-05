//
//  PhotoDetailView.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import SwiftUI

struct PhotoDetailView: View {

    @ObservedObject var viewModel: ViewModel
    @State private var image: UIImage?
    let photo: Photo
    
    
    var body: some View {
        ScrollView {
            let descriptionAttributedString = photo.description.htmlToAttributedString ?? NSAttributedString(string: "")
            
            if let image = image {
                Image(uiImage: image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 200)
                    .cornerRadius(10)
            } else {
                ProgressView()
                    .onAppear(perform: loadImage)
            }
            
            Text(photo.title)
            Spacer()
            Text("Description")
                .frame(alignment: .leading)
                .bold()
            Text(AttributedString(descriptionAttributedString))
            Text("Author")
                .frame(alignment: .leading)
                .bold()
            Text(photo.author)
            Spacer()
            Text("Published Date")
                .frame(alignment: .leading)
                .bold()
            Text(viewModel.formatDate(photo.published))
        }
        .frame(alignment: .leading)
        .padding(30)
    }
    
    private func loadImage() {
        Task {
            guard let imageURL = URL(string: photo.media["m"] ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            image = UIImage(data: data)
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(viewModel: ViewModel(), photo: Photo.defaultValue)
    }
}
