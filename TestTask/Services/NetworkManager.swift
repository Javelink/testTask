//
//  NetworkManager.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {

    static let instance = NetworkManager()
    var films = [Film]()
    
    func fetchMovies(_ endpoint: MovieEndpoint) {
        films.removeAll()
        APIClient.fetchResponce(endpoint) { [weak self] (model: Movies) in
            
            guard let weakSelf = self,
                  let results = model.results else {
                return
            }
            
            for result in results {
                
                guard let filmId = result.id,
                      let title = result.title,
                      let url = result.posterPath else {
                    return
                }
                
                let posterPath = endpoint.imageBaseUrl + "\(url)"
                                
                let film = Film(filmId: filmId, title: title, posterPath: posterPath)
                weakSelf.films.append(film)
            }
        }
    }
}
