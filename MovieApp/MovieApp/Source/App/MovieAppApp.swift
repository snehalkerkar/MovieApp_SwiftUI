//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import SwiftUI

@main
struct MovieAppApp: App {

    @StateObject private var movieViewModel = MovieViewModel(
        movieService: MovieService(networkManager: NetworkManager())
    )

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(movieViewModel)
        }
    }
}
