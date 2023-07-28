//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

/// This is protocol class for NetworkManagerProtocol
protocol NetworkManagerProtocol {
    typealias DataTaskResult = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

    /// Data task request
    /// - Parameters:
    ///   - urlRequest: urlRequest
    ///   - completion: completion block with response data and error
    func request(urlRequest: URLRequest, completion: @escaping DataTaskResult) throws
}

// MARK: - NetworkManagerProtocol

final class NetworkManager: NSObject, NetworkManagerProtocol {

    func request(urlRequest: URLRequest, completion: @escaping DataTaskResult) throws {
        URLSession.shared.dataTask(with: urlRequest, completionHandler: completion).resume()
    }
}

