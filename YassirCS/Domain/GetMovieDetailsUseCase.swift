//
//  MovieDetailsUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation

protocol GetMovieDetailsUseCaseProtocol {
    func execute(withMovieId id: Int,
                 completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void)
}

class GetMovieDetailsUseCase: GetMovieDetailsUseCaseProtocol {
    private let repo: MoviesDetailsRepoProtocol
    
    init(repo: MoviesDetailsRepoProtocol) {
        self.repo = repo
    }
    
    func execute(withMovieId id: Int,
                 completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        self.repo.getDetailsMovies(withId: id) { (result) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
