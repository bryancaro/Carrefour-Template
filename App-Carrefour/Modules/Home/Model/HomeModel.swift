//
//  HomeModel.swift
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

struct HomeModel: Hashable {
    var name: String
    var age: Double
    var sex: String
}

extension HomeModel {
    static let mockedData: [HomeModel] = [
        HomeModel(name: "Biden", age: 78, sex: "M"),
        HomeModel(name: "Putin", age: 66, sex: "M"),
        HomeModel(name: "Duque", age: 40, sex: "M")
    ]
}

