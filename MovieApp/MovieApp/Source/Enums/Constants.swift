//
//  Constants.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

/// Enum to define constants being used throgh out the app
enum Constants {
    static let statusOK = 200
    static let baseURL =  "https://api.themoviedb.org"
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let kAuthorization = "Authorization"
    static let kQuery = "query"
    static let kContentType = "Content-Type"
    static let contentJSON = "application/json"
    static let contentURLEncoded = "application/x-www-form-urlencoded; charset=utf-8"
    static let requestTimeout = TimeInterval(10)
}
