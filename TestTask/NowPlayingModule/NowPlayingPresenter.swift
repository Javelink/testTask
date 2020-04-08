//
//  NowPlayingPresenter.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

class NowPlayingPresenter {
    private let networkManager = NetworkManager()
    
    func fetch() {
        networkManager.fetchMovies(.nowPlaying)
    }
    
    func filmData(_ index: Int) -> Film {
        let filmId = networkManager.films[index].filmId
        let title = networkManager.films[index].title
        let posterPath = networkManager.films[index].posterPath
        
        return Film(filmId: filmId, title: title, posterPath: posterPath)
    }
    
    func filmsCount() -> Int {
        return networkManager.films.count
    }
    
}
