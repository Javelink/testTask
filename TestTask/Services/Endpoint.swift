//
//  Endpoint.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var staticParameters: String { get }
}

private let apiKey = "1126689c61336f80a54b2e1873493d2e"

// MARK: - MovieEndpoint
enum MovieEndpoint {
    case popular
    case nowPlaying
}

extension MovieEndpoint: EndpointType {
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/movie/")!
    }

    var path: String {
        switch self {
        case .popular: return "popular"
        case .nowPlaying: return "now_playing"
        }
    }

    var staticParameters: String {
        return "?api_key=\(apiKey)"
    }
    
    var imageBaseUrl: String {
        return "https://image.tmdb.org/t/p/w1280"
    }
}
