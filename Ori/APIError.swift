//
//  APIError.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/6/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
