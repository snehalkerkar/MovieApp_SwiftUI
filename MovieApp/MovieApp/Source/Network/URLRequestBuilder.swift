//
//  URLRequestBuilder.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

/// Structure is being used to build the API request
struct URLRequestBuilder {

    private init() {}

    static func buildURLRequest(endpoint: Endpoint) throws -> URLRequest {
        guard let requestURL = endpoint.url else {
            throw AppError.technical
        }
        var request = URLRequest(url: requestURL)

        // Method
        request.httpMethod = endpoint.httpMethod.rawValue

        // Headers
        if let headers = endpoint.headers {
            request.allHTTPHeaderFields = headers
        }

        // JSON
        if let json = endpoint.jsonParameters {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
            if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
                request.setValue(Constants.contentJSON, forHTTPHeaderField: Constants.kContentType)
            }
        }

        // URL encoded params
        if let urlParameters = endpoint.urlParameters {
            if var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false) {
                urlParameters.forEach { key, value in
                    urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
                }
                request.url = urlComponents.url
            }
            if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
                request.setValue(
                    Constants.contentURLEncoded,
                    forHTTPHeaderField: Constants.kContentType
                )
            }
        }
        return request
    }
}
