//
//  Bidable.swift
//  EvolutionApp
//
//  Created by Максим Ламанский on 06.05.2021.
//  Copyright © 2021 Evolution.Life. All rights reserved.
//

import Foundation
import Combine

protocol Bindable {
    var cancellables: [AnyCancellable] { get set }
    
    func setupBindings()
}

extension Bindable {

    mutating func clearSubscriptions() {
        cancellables.forEach({ $0.cancel() })
        cancellables = []
    }

}
