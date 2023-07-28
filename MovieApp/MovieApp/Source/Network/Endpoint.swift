//
//  Endpoint.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

enum Auth {
    static let token = "Bearer <SET_AUTH_TOKEN>"
}

/// Enum to define API request path
enum API: String {
    case search = "/3/search/movie"
}

/// Enum to define HTTP Methods
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias HTTPHeaders = [String: String]

/// Structure is used to setup url request parameters
struct Endpoint {
    var baseURL = URL(string: Constants.baseURL)
    var path: String
    var queryItems: [URLQueryItem]?
    var jsonParameters: [String: Any]?
    var urlParameters: [String: String]?
    var headers: HTTPHeaders?
    var httpMethod: HTTPMethod
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = baseURL?.scheme
        components.host = baseURL?.host
        components.path = path
        components.queryItems = queryItems?.map { item in
            let encodedValue =
              item.value?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return URLQueryItem(name: item.name, value: encodedValue)
        }
        return components.url
    }
}
