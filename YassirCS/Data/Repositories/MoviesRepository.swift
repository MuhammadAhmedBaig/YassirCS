//
//  MoviesRepository.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol MoviesListRepoProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void)
}

protocol MoviesDetailsRepoProtocol {
    func getDetailsMovies(withId id: Int,
                          completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void)
}


class MoviesRepository: MoviesListRepoProtocol, MoviesDetailsRepoProtocol {
    private var moviesAPIs: MoviesAPICallsProtocol
    
    init(moviesAPICalls: GetMoviesListAPIProtocol) {
        self.moviesAPIs = moviesAPICalls
    }
    
    init(moviesAPICalls: GetMovieDetailsAPIProtocol) {
        self.moviesAPIs = moviesAPICalls
    }
    
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void) {
        (self.moviesAPIs as! GetMoviesListAPIProtocol).getMovies(completion: completion)
    }
    
    func getDetailsMovies(withId id: Int,
                          completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        (self.moviesAPIs as! GetMovieDetailsAPIProtocol).getMovieDetails(withId: id, completion: completion)
    }
}


