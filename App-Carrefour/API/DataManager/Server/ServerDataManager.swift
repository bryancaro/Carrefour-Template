//
//  ServerDataManager.swift
//  App-Carrefour
//
//  Created by Bryan Caro on 2/24/22.
//

import Foundation
import Combine

class ServerDataManager {
    weak var callbackDelegate: ViewModelProtocol?
    
    convenience init(delegate: ViewModelProtocol?) {
        self.init()
        self.callbackDelegate = delegate
    }

    // MANAGE ERRORS
}
