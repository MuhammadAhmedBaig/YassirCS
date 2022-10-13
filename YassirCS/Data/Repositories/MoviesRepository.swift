//
//  NewsRepository.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol MoviesListRepoProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void)
}

class MoviesRepository: MoviesListRepoProtocol {
    private var moviesAPIs: GetMoviesAPIProtocol
    
    init(moviesAPICalls: GetMoviesAPIProtocol = MoviesAPICalls()) {
        self.moviesAPIs = moviesAPICalls
    }
    
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void) {
        self.moviesAPIs.getMovies(completion: completion)
    }
}


