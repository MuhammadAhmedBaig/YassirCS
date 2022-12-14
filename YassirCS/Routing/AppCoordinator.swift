//
//  AppCoordinator.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc: MoviesListView = MoviesListView(viewModel: self.makeMoviesListViewModel())
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func makeMoviesListViewModel() -> MoviesListViewModel {
        return MoviesListViewModel(useCase: makeGetMoviesListUseCase())
    }
    
    private func makeGetMoviesListUseCase() -> GetMoviesListUseCaseProtocol {
        return GetMoviesListUseCase(repo: makeMoviesRepository())
    }
    
    private func makeMoviesRepository() -> MoviesListRepoProtocol {
        return MoviesRepository(moviesAPICalls: makeAPICallsRepo())
    }
    
    private func makeAPICallsRepo() -> GetMoviesListAPIProtocol {
        return MoviesAPICalls()
    }
    
    func showMovieDetails(withMovieId id: Int) {
        let coordinator = MovieDetailsCoordinator(navigationController: navigationController,
                                                  dependencies: MovieDetailsCoordinator.Dependencies(movieId: id))
        coordinator.start()
    }
}
