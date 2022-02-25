//
//  ViewModelProtocol.swift
//  App-Carrefour
//
//  Created by Bryan Caro on 2/24/22.
//

import Foundation

typealias VoidHandler = () -> Void
typealias Handler<T> = (T) -> Void

protocol ViewModelProtocol: AnyObject {
    func defaultError(_ error: String)
    func serverError(_ error: String)
    func noInternetError(_ error: String)
}
