//
//  GetMoviesUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol GetMoviesUseCaseProtocol {
    func execute(completion: @escaping (Result<[Movie], YCSError>) -> Void)
}

class GetMoviesUseCase: GetMoviesUseCaseProtocol {
    private let repo: MoviesListRepoProtocol
    
    init(repo: MoviesListRepoProtocol = MoviesRepository()) {
        self.repo = repo
    }
    
    func execute(completion: @escaping (Result<[Movie], YCSError>) -> Void) {
        self.repo.getMovies { (result) in
            switch result {
            case .success(let model):
                completion(.success(model.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
