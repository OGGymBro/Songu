//
//  HTTPClient.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

enum HttpMethods:String {
    case POST, GET, PUT, DELETE
}

enum MIMEType :String {
    case JSON = "application/json"
}

enum HttpHeaders:String {
    case contentType = "Content-Type"
}

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
    
    
    
    func sendData<T:Codable>(url:URL,object: T,httpMethod: String) async throws {
        var request = URLRequest(url:url)
        
        request.httpMethod = httpMethod
        request.addValue(MIMEType.JSON.rawValue,
                         forHTTPHeaderField: HttpHeaders.contentType.rawValue)
        
        request.httpBody = try? JSONEncoder().encode(object)
        
        //tuple
        let (_,response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
    }
}
