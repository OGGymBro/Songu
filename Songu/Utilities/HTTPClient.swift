//
//  HTTPClient.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}

class HTTPClient {
    private init() {}
    
    static let shared = HTTPClient()
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return object
    }
}
