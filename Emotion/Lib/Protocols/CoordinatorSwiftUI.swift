//
//  CoordinatorSwiftUI.swift
//  EvolutionApp
//
//  Created by Максим Ламанский on 06.05.2021.
//  Copyright © 2021 Evolution.Life. All rights reserved.
//

import Foundation
import SwiftUI

protocol CoordinatorSwiftUI {
    
    var navCoordinator: NavigatorSwiftUI { get set }
    var currentScene: AnyView { get set }
    
    func start()
    func back() 
    
}
