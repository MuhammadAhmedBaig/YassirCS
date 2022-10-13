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
//        var urlString: String
    }

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let vc: MovieDetailsView = MovieDetailsView()
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
//    private func makeNewsDetailViewModel() -> NewsDetailViewModel {
//        return NewsDetailViewModel(urlString: self.dependencies.urlString)
//    }
    
}
