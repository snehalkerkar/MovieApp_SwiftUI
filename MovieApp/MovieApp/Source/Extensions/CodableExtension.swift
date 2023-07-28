//
//  CodableExtension.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

extension Data {
    func decode<T: Decodable>(type: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode(type, from: self)
        } catch {
            print(error)
        }
        return nil
    }
}
