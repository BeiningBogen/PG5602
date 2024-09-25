//
//  URLRequest+Nettbutikk.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 25/09/2024.
//

import Foundation



extension URLRequest {
    
    
    static func standard(url: URL) -> URLRequest {
        
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept" : "application/json"]
        urlRequest.timeoutInterval = 10
        
        return urlRequest
    }
    
    
}
