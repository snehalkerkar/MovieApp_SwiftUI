//
//  ContentView.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var movieViewModel: MovieViewModel

    var body: some View {
        SearchView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                MovieViewModel(
                    movieService: MovieService(networkManager: NetworkManager())
                )
            )
    }
}
