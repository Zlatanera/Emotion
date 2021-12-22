//
//  NavigatorSwiftUI.swift
//  EvolutionApp
//
//  Created by Максим Ламанский on 06.05.2021.
//  Copyright © 2021 Evolution.Life. All rights reserved.
//

import Foundation

protocol NavigatorSwiftUI {
    
    var currentCoordinator: CoordinatorSwiftUI? { get set }
    
    var previousCoordinators: [CoordinatorSwiftUI] { get set }
    
    func push(_ coordinator: CoordinatorSwiftUI)

    func pop()
    
    func clear()
    
    func allCoordinators() -> [CoordinatorSwiftUI?]
    
}

protocol NavigatorGeneric {
    
    associatedtype Typ
    
    var current: Typ? { get set }
    
    var previous: [Typ] { get set }
    
    func push(_ coordinator: Typ)

    func pop()
    
    func clear()
    
    func allScenes() -> [Typ?]
    
}
