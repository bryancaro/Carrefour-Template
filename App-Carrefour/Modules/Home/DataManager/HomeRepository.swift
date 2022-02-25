//
//  HomeRepository.swift
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

protocol HomeRepositoryProtocol: ViewModelDataManagerProtocol {
    func getUsers(completion: @escaping([HomeModel]) -> Void)
}

class HomeRepository: ServerDataManager {
    private let server: HomeServer
    private let local: HomeLocal
    
    init(server: HomeServer = HomeServer(),
         local: HomeLocal = HomeLocal()) {
        self.server = server
        self.local = local
    }
}

extension HomeRepository: HomeRepositoryProtocol {
    func getUsers(completion: @escaping([HomeModel]) -> Void) {
        server.getData()
    }
}

