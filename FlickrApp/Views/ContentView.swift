//
//  ContentView.swift
//  FlickrApp
//
//  Created by Shiva Teja Celumula on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        let columns = [ GridItem(.adaptive(minimum: 100, maximum: 150))]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.photos) { photo in
                        NavigationLink(destination: PhotoDetailView(viewModel: viewModel, photo: photo)) {
                            PhotoCellView(photo: photo)
                        }
                    }
                }
                .navigationTitle("Flickr Photos")
            }
            .padding()
        }
        .searchable(text: $viewModel.searchText)
        .onAppear(perform: viewModel.performSearch)
        .onSubmit(of: .search, viewModel.performSearch)
        .onChange(of: viewModel.searchText) { _ in
            viewModel.performSearch()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
