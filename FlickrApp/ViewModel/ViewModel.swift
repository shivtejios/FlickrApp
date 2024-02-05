//
//  ViewModel.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    private let flickrURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="

    @Published var photos = [Photo]()
    @Published var searchText = ""
    
    func performSearch() {
        Task {
            guard let url = URL(string: flickrURL.appending(searchText)) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            photos = (try JSONDecoder().decode(PhotosResponse.self, from: data)).items
        }
    }
    
    func formatDate(_ dateStr: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        var convertedDate = Date()
        if let date = formatter.date(from: dateStr) {
            convertedDate = date
        }
        formatter.dateFormat = "MMM dd, yyyy HH:mm:ss"
        return formatter.string(from: convertedDate)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
