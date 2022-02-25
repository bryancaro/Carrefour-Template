//
//  AppError.swift
//  App-Carrefour
//
//  Created for AxCloud in 2022
//  Using Swift 5.0
//  Running on macOS 12.1
//
//  Created by Bryan Caro on 2/24/22.
//
//

import Foundation

struct AppError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
