//
//  NetworkControllerProtocol.swift
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

protocol NetworkProtocol {
    var manager: NetworkController { get }
}

protocol NetworkControllerProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func request<T>(type: T.Type,
                url: URL,
                headers: Headers
    ) -> AnyPublisher<T, Error> where T: Decodable
}


