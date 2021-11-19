//
//  NavigationControllerSwiftUI.swift
//  EvolutionApp
//
//  Created by Максим Ламанский on 06.05.2021.
//  Copyright © 2021 Evolution.Life. All rights reserved.
//

import Foundation
import Combine

class NavigationControllerSwiftUI: ObservableObject, NavigatorSwiftUI {
    
    @Published var currentCoordinator: CoordinatorSwiftUI?
    
    internal var previousCoordinators: [CoordinatorSwiftUI] = []
    
    func push(_ coordinator: CoordinatorSwiftUI) {
        if let prevCoordinator = self.currentCoordinator {
            previousCoordinators.append(prevCoordinator)
        }
        self.currentCoordinator = coordinator
    }

    func pop() {
        self.currentCoordinator = previousCoordinators.popLast()
    }
    
    func clear() {
        self.previousCoordinators.removeAll()
        self.currentCoordinator = nil
    }
    
    func allCoordinators() -> [CoordinatorSwiftUI?] {
        previousCoordinators + [currentCoordinator]
    }
    
}
