//
//  FakeMoviesAPICalls.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import YassirCS

///LIST API
class FakeSuccessMoviesListAPICalls: GetMoviesListAPIProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void) {
        completion(.success(FakeData.FakeListData.makeFakeSuccessData()))
    }
}

class FakeFailureMoviesListAPICalls: GetMoviesListAPIProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}


///DETAILS API
class FakeSuccessMovieDetailsAPICalls: GetMovieDetailsAPIProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        completion(.success(FakeData.FakeDetailsData.makeFakeSuccessData()))
    }
}

class FakeFailureMoviesDetailsAPICalls: GetMovieDetailsAPIProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
