//
//  NetworkLayer.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 06/10/2022.
//

import Foundation

protocol NetworkProtocol {
    func executeGetAPI<T: Decodable>(withURLRequest request: URLRequest, completion: @escaping (Result<T, YCSError>) -> Void)
}

class NetworkLayer: NetworkProtocol {
    private var session: URLSession
    private var apiTask: URLSessionDataTask?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func executeGetAPI<T: Decodable>(withURLRequest request: URLRequest, completion: @escaping (Result<T, YCSError>) -> Void) {
        self.apiTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(YCSError(message: Constants.NetworkCallError.wentWrong.rawValue)))
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(YCSError(message: Constants.NetworkCallError.wentWrong.rawValue)))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(YCSError(message: Constants.NetworkCallError.parsingError.rawValue)))
            }
            
        }
        apiTask?.resume()
    }
}
