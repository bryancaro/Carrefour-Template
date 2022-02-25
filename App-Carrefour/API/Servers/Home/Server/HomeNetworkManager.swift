//
//  HomeNetworkManager.swift
//  App-Carrefour
//
//  Created by Bryan Caro on 2/24/22.
//

import Foundation
import Combine

protocol UsersLogicControllerProtocol: NetworkControllerProtocol {
    func getMovies() -> AnyPublisher<HomeModelResponse, Error>
    func getMovieDetail(id: Int) -> AnyPublisher<HomeModelResponse, Error>
}

extension NetworkController: UsersLogicControllerProtocol {
    func getMovies() -> AnyPublisher<HomeModelResponse, Error> {
        let endpoint = Endpoint.movies

        
        return request(type: HomeModelResponse.self,
                   url: endpoint.url,
                   headers: endpoint.headers)
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<HomeModelResponse, Error> {
        let endpoint = Endpoint.moviesDetail(id: "\(id)")

        return request(type: HomeModelResponse.self,
                   url: endpoint.url,
                   headers: endpoint.headers)
    }
}
