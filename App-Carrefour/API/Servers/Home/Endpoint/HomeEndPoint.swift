//
//  HomeEndPoint.swift
//  App-Carrefour
//
//  Created by Bryan Caro on 2/24/22.
//

import Foundation

extension Endpoint {
    static var movies: Self {
        return Endpoint(path: "/user")
    }

    static func moviesDetail(id: String) -> Self {
        return Endpoint(path: id,
                        queryItems: [ URLQueryItem(name: "limit",
                                                   value: "\(3)") ]
        )
    }
}
