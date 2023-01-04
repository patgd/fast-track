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
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a song", text: $searchText)
                Button("Search") {
                    // TBD
                }
            }
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(1..<100) { i in
                        Color.red
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
