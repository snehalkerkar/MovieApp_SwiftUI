//
//  MovieService.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

final class MovieService: NSObject {

    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func searchMovie(name: String, completion: @escaping ([Movie]) -> Void) {
        let headers = [Constants.kAuthorization: Auth.token]
        let endpoint = Endpoint(
            path: API.search.rawValue,
            queryItems: [URLQueryItem(name: Constants.kQuery, value: name)],
            headers: headers,
            httpMethod: .get
        )
        do {
            let urlRequest = try URLRequestBuilder.buildURLRequest(endpoint: endpoint)
            try networkManager.request(urlRequest: urlRequest, completion: { data, response, _ in
                completion(self.parse(response: response as? HTTPURLResponse, data: data))
            })
        } catch {
            print(error)
        }
    }
}

extension MovieService {
    private func parse(response: HTTPURLResponse?, data: Data?) -> [Movie] {
        guard response?.statusCode == Constants.statusOK, let data else {
            return []
        }
        return data.decode(type: MovieMetadata.self)?.results ?? []
    }
}
