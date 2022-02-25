//
//  HomeServer.swift
//  App-Carrefour
//
//  Created for App-Carrefour in 2022
//  Using Swift 5.0
//  Running on macOS 12.2
//
//  Created by Bryan Caro on 2/24/22.
//  
//

import Foundation
import Combine

protocol HomeServerProtocol {
//    func example(completion: @escaping(Result<[T], Error>) -> Void)
}

final class HomeServer: Network, HomeServer.ServerCalls {
    typealias ServerCalls = HomeServerProtocol
    
    func getData() {
        let request = manager.getMovies()
        
    }
    
}

