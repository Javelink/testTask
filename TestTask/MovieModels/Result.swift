//
//  Result.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

struct Result: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case ru = "ru"
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
    case fr = "fr"
    case hi = "hi"
    case it = "it"
    case tl = "tl"
}
