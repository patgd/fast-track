//
//  TrackView.swift
//  FastTrack
//
//  Created by pat on 1/4/23.
//

import SwiftUI

struct TrackView: View {
    let track: Track
    let onSelected: (Track) -> Void
    
    var body: some View {
        Button {
            print("Play \(track.trackName)")
            onSelected(track)
        } label: {
            ZStack(alignment: .bottom) {
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
                
                VStack {
                    Text(track.trackName)
                        .font(.headline)
                    Text(track.artistName)
                        .foregroundStyle(.secondary)
                }
                .padding(5)
                .frame(width: 150)
                .background(.regularMaterial)
            }
        }
        .buttonStyle(.borderless)
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: Track(trackId: 1,
                               artistName: "Nirvana",
                               trackName: "Smells Like Teen Spirit",
                               previewUrl: URL(string: "abc")!,
                               artworkUrl100: "https://bit.ly/teen-spirit")
        ) { track in
            
        }
    }
}
