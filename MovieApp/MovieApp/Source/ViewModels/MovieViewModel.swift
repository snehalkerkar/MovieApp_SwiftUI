//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

@MainActor
final class MovieViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var errorMessage = "Unknown Error"
    @Published var showError = false
    
//    let movieService = MovieService(networkManager: NetworkManager())

    private let movieService: MovieService

    init(movieService: MovieService) {
        self.movieService = movieService
    }

    func searchMovie(name: String) {
        movieService.searchMovie(name: name) { movies in
            DispatchQueue.main.async {
                self.movies = movies
                self.showError = movies.isEmpty
            }
        }
    }
}
