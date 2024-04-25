//
//  Endpoint.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 25.04.24.
//

import UIKit

enum Endpoint {
    case fetchCountry(url: String = "https://restcountries.com/v3.1/all")
    case postCountry(url: String = "/v2/post")
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = []
        return components.url
    }
    private var path: String {
        switch self {
        case.fetchCountry(url: url):
            return url
        }
    }
}
