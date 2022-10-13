//
//  FakeGetMovieDetailsSuccessUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import YassirCS

class FakeGetMovieDetailsSuccessUseCase: GetMovieDetailsUseCaseProtocol{
    func execute(withMovieId id: Int, completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        completion(.success(FakeData.FakeDetailsData.makeFakeSuccessData()))
    }
}

class FakeGetMoviesDetailsFailureUseCase: GetMovieDetailsUseCaseProtocol {
    func execute(withMovieId id: Int, completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
