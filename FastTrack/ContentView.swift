//
//  ContentView.swift
//  FastTrack
//
//  Created by pat on 1/4/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    enum SearchState { case none, searching, success, error }
 
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    @AppStorage("searchText") var searchText = ""
    @State private var tracks = [Track]()
    @State private var audioPlayer: AVPlayer?
    @State private var searchState = SearchState.none
    
    func performSearch() async throws {
        guard let searchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&limit=100&entity=song") else { return }
        let (data, _) = try await URLSession.shared.data(from: url)
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        tracks = searchResult.results
    }
    func startSearch() {
        searchState = .searching
        
        Task {
            do {
                try await performSearch()
                searchState = .success
            } catch {
                searchState = .error
            }
        }
    }
    func play(_ track: Track) {
        audioPlayer?.pause()
        audioPlayer = AVPlayer(url: track.previewUrl)
        audioPlayer?.play()
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a song", text: $searchText)
                    .onSubmit(startSearch)
                Button("Search", action: startSearch)
            }
            .padding([.top, .horizontal])
            
            switch searchState {
            case .none:
                Text("Enter a search term to begin")
                    .frame(maxHeight: .infinity)
            case .searching:
                ProgressView()
                    .frame(maxHeight: .infinity)
            case .success:
                ScrollView {
                    LazyVGrid(columns: gridItems) {
                        ForEach(tracks) { track in
                            TrackView(track: track, onSelected: play)
                        }
                    }
                    .padding()
                }
            case .error:
                Text("Sorry, your search failed— please check your internet connection and try again.")
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
