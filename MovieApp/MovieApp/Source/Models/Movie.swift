//
//  Movie.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

struct MovieMetadata: Decodable {
    let page: Int
    let results: [Movie]?
    let totalPages: Int
    let totalResults: Int
}

struct Movie: Decodable, Hashable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int32
    let originalLanguage: String?
    let originalTitle: String
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int32
}
