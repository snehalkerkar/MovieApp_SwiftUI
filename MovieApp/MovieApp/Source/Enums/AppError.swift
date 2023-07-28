//
//  AppError.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import Foundation

/// Enum to define app errors
enum AppError: Int, Error {
    case api
    case network
    case technical
    case timeout
    case unknown
}
