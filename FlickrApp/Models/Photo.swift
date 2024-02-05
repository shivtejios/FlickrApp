//
//  Photo.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import Foundation

struct Photo: Codable, Identifiable, Hashable {
    var id = UUID()
    
    let title: String
    let link: String
    let media: [String: String]
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case dateTaken = "date_taken"
        case description
        case published
        case author
        case authorId = "author_id"
        case tags
    }
    
    static var defaultValue: Photo {
        Photo(title: "Saturn", link: "https://www.flickr.com/photos/20388962@N04/53506840899/",
              media: ["m": "https://live.staticflickr.com/65535/53506840899_34066cbcc9_m.jpg"],
              dateTaken: "2024-02-04T13:58:31-08:00",
              description: "James posted a photo",
              published: "2024-02-05T16:45:37Z",
              author: "james@flickr.com (james0923)",
              authorId: "123141212",
              tags: "saturn planet")
    }
}
