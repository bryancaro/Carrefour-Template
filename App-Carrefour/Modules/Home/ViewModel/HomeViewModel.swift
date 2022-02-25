//
//  HomeViewModel.swift
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

class HomeViewModel: ObservableObject {
    @Published var appError: AppError? = nil
    @Published var isLoading: Bool = false
    
    @Published var usersData: [HomeModel] = HomeModel.mockedData
        
    private var repository: HomeRepositoryProtocol
    private var callback: ViewModelProtocol!
    
    init(repository: HomeRepositoryProtocol = HomeRepository()) {
        self.repository = repository
        self.callback = self
        self.repository.callbackDelegate = self.callback
    }
    
    func onAppear() {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [onAppear]")
        getUsersData()
    }
    
    func onDisappear() {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [onDisappear]")
    }
    
    func dismissButtonAction() {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [dismissButtonAction]")
    }
}

extension HomeViewModel {
    func getUsersData() {
        isLoading = true
        repository.getUsers { [weak self] data in
            self?.usersData = data
            self?.isLoading = false
        }
    }
}

extension HomeViewModel: ViewModelProtocol {
    func defaultError(_ error: String) {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [ERROR] ⚠️ \(error)")
        self.isLoading = false
        self.appError = AppError(errorString: error)
    }

    func serverError(_ error: String) {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [ERROR] ⚠️ \(error)")
        self.isLoading = false
        self.appError = AppError(errorString: error)
    }

    func noInternetError(_ error: String) {
        print("[DEBUG]-[VIEWMODEL] [HomeViewModel]: [ERROR] ⚠️ \(error)")
        self.isLoading = false
        self.appError = AppError(errorString: error)
    }
}
