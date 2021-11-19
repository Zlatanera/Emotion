//
//  NavigationControllerGeneric.swift
//  EvolutionApp
//
//  Created by Максим Ламанский on 06.05.2021.
//  Copyright © 2021 Evolution.Life. All rights reserved.
//

import Foundation
import Combine

class NavigationControllerGeneric<T>: ObservableObject, NavigatorGeneric {
    
    @Published var current: T?
    
    internal var previous: [T] = []
    
    func push(_ item: T) {
        if let prev = self.current {
            previous.append(prev)
        }
        self.current = item
    }

    func pop() {
        self.current = previous.popLast()
    }
    
    func clear() {
        self.previous.removeAll()
        self.current = nil
    }
    
    func allScenes() -> [T?] {
        previous + [current]
    }
    
}
