//
//  ContentView.swift
//  FastTrack
//
//  Created by pat on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    @AppStorage("searchText") var searchText = ""
    @State private var tracks = [Track]()
    
    func performSearch() async throws {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&limit=100&entity=song") else { return }
        let (data, _) = try await URLSession.shared.data(from: url)
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        tracks = searchResult.results
    }
    func startSearch() {
        Task {
            try await performSearch()
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a song", text: $searchText)
                    .onSubmit(startSearch)
                Button("Search", action: startSearch)
            }
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(tracks) { track in
                        AsyncImage(url: track.artworkURL) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable()
                            case .failure(_):
                                Image(systemName: "questionmark")
                                    .symbolVariant(.circle)
                                    .font(.largeTitle)
                            default:
                                ProgressView()
                            }
                        }
                        .frame(width: 150, height: 150)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
