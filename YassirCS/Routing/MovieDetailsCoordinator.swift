//
//  MovieDetailsCoordinator.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation
import UIKit

class MovieDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dependencies: Dependencies
    
    struct Dependencies {
        var movieId: Int
    }

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let vc: MovieDetailsView = MovieDetailsView(viewModel: self.makeMovieDetailsViewModel())
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    private func makeMovieDetailsViewModel() -> MovieDetailsViewModel {
        return MovieDetailsViewModel(useCase: makeGetMovieDetailsUseCase(),
                                     movieId: dependencies.movieId)
    }
    
    private func makeGetMovieDetailsUseCase() -> GetMovieDetailsUseCaseProtocol {
        return GetMovieDetailsUseCase(repo: makeMoviesRepository())
    }
    
    private func makeMoviesRepository() -> MoviesDetailsRepoProtocol {
        return MoviesRepository(moviesAPICalls: makeAPICallsRepo())
    }
    
    private func makeAPICallsRepo() -> GetMovieDetailsAPIProtocol {
        return MoviesAPICalls()
    }
}
