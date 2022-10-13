//
//  FakeGetMoviesListUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import YassirCS

class FakeGetMoviesListSuccessUseCase: GetMoviesListUseCaseProtocol{
    func execute(completion: @escaping (Result<[MovieBreifModel], YCSError>) -> Void) {
        completion(.success(FakeData.FakeListData.makeFakeSuccessData().results))
    }
}

class FakeGetMoviesListFailureUseCase: GetMoviesListUseCaseProtocol {
    func execute(completion: @escaping (Result<[MovieBreifModel], YCSError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
