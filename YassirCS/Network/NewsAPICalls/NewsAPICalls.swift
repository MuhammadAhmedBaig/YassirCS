//
//  NewsAPICalls.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol GetMoviesAPIProtocol {
    func getMovies(completion: @escaping (Result<MoviesModel, YCSError>) -> Void)
}

class MoviesAPICalls: GetMoviesAPIProtocol {
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
    
    private func makeQueryParam() -> [String: String] {
        return [Constants.API.QueryParam.apiKeyParam.rawValue: Constants.API.key.rawValue]
    }
}
