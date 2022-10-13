//
//  MoviesAPICalls.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol MoviesAPICallsProtocol{}

protocol GetMoviesListAPIProtocol: MoviesAPICallsProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void)
}

protocol GetMovieDetailsAPIProtocol: MoviesAPICallsProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void)
}

extension GetMovieDetailsAPIProtocol {
    fileprivate func makeURLString(withId id: Int) -> String {
        return "\(Constants.API.EndPoints.details.rawValue)\(id)"
    }
}

class MoviesAPICalls: GetMoviesListAPIProtocol, GetMovieDetailsAPIProtocol {
    private var network: NetworkProtocol
    
    init(networkProtocol: NetworkProtocol = NetworkLayer()) {
        self.network = networkProtocol
    }
    
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void) {
        let newtorkConfig = APINetworkConfig(baseURL: Constants.API.baseURL.rawValue,
                                             urlAppending: Constants.API.EndPoints.discoverMovies.rawValue,
                                             queryParameters: makeQueryParam(),
                                             method: .get)
        
        guard let urlRequest = RequestMaker.urlRequest(with: newtorkConfig) else {
            completion(.failure(YCSError(message: Constants.NetworkCallError.wentWrong.rawValue)))
            return
        }
        network.executeGetAPI(withURLRequest: urlRequest, completion: completion)
    }
    
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetailsModel, YCSError>) -> Void) {
        let newtorkConfig = APINetworkConfig(baseURL: Constants.API.baseURL.rawValue,
                                             urlAppending: makeURLString(withId: id),
                                             queryParameters: makeQueryParam(),
                                             method: .get)
        
        guard let urlRequest = RequestMaker.urlRequest(with: newtorkConfig) else {
            completion(.failure(YCSError(message: Constants.NetworkCallError.wentWrong.rawValue)))
            return
        }
        network.executeGetAPI(withURLRequest: urlRequest, completion: completion)
    }
    
    private func makeQueryParam() -> [String: String] {
        return [Constants.API.QueryParam.apiKeyParam.rawValue: Constants.API.key.rawValue]
    }
}
