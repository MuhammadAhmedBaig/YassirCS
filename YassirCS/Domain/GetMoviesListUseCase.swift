//
//  GetMoviesListUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol GetMoviesListUseCaseProtocol {
    func execute(completion: @escaping (Result<[MovieBreifModel], YCSError>) -> Void)
}

class GetMoviesListUseCase: GetMoviesListUseCaseProtocol {
    private let repo: MoviesListRepoProtocol
    
    init(repo: MoviesListRepoProtocol) {
        self.repo = repo
    }
    
    func execute(completion: @escaping (Result<[MovieBreifModel], YCSError>) -> Void) {
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
