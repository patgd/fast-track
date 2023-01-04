//
//  ContentView.swift
//  FastTrack
//
//  Created by pat on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    let gridItems: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    var body: some View {
        LazyVGrid(columns: gridItems) {
            ForEach(1..<100) { i in
                Color.red
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
