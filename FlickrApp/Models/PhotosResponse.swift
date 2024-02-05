//
//  PhotosResponse.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import Foundation

struct PhotosResponse: Codable {
    
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case description
        case modified
        case generator
        case items
    }
}
