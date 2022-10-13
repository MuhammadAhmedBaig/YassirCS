//
//  MovieListViewModel.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

struct MovieUIModel {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    var mediaURL: String
    
}

protocol MoviesListVMDelegate: AnyObject {
    func sucessWhileFetchingData()
    func show(error msg: String)
    func moveToDetails(withURLString urlStr: String)
}

class MoviesListViewModel {
    
    weak var delegate: MoviesListVMDelegate?
    private var useCase: GetMoviesUseCaseProtocol
    private var uiModels = [MovieUIModel]()
    
    init(useCase: GetMoviesUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getNewsFeeds() {
        self.useCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let moviesList):
                self.makeUIModels(moviesList: moviesList)
            case .failure(let error):
                self.delegate?.show(error: error.localizedDescription)
            }
        }
    }
    
    private func makeUIModels(moviesList: [Movie]) {
        defer {
            self.delegate?.sucessWhileFetchingData()
        }
        
        for movie in moviesList {
            uiModels.append(MovieUIModel(id: movie.id,
                                         title: movie.title,
                                         description: movie.description,
                                         releaseDate: movie.releaseDate,
                                         mediaURL: movie.mediaURL))
        }
    }
    
    func getUIModelsCount() -> Int {
        return uiModels.count
    }
    
    func getUIModel(atIndex index: Int) -> MovieUIModel? {
        return uiModels.count > index ? uiModels[index] : nil
    }
    
    func didTapOnItem(atIndex index: Int) {
        self.delegate?.moveToDetails(withURLString: "")
    }
}
