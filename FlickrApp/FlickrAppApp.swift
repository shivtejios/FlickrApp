//
//  FlickrAppApp.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import SwiftUI

@main
struct FlickrAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
