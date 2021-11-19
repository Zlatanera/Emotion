

import Foundation
import Combine
import SwiftUI

class EmotionCoordinator: ObservableObject, CoordinatorSwiftUI {
    
    @Published var currentScene: AnyView = AnyView(EmptyView())
    //Published для списка
    
    internal var cancellables: [AnyCancellable] = []
    internal var navScene = NavigationControllerGeneric<Emotion.Flow>()
    internal var navCoordinator: NavigatorSwiftUI
    
    init(navigator: NavigatorSwiftUI) {
        self.navCoordinator = navigator
        setupCoordinator()
        setupBindings()
        self.start()
    }
    
    private func setupCoordinator() {
        navCoordinator.push(self)
    }
    
    func start() {
        showMain()
    }
    
    func back() {
        navScene.pop()
        if navScene.current == nil {
            weak var self2 = self
            self2?.clearSubscriptions()
            self2?.navCoordinator.pop()
        }
    }
    
    private func showScene(for state: Emotion.Flow) {
        switch state {
        case .main: currentScene = AnyView(MainView().environmentObject(self))
        case .settings: currentScene = AnyView(SettingsView().environmentObject(self))
        }
    }
    
    func showMain() {
        navScene.push(.main)
            
    }
    
    func showSettings() {
        navScene.push(.settings)
    }
    
}

extension EmotionCoordinator: Bindable {
    internal func setupBindings() {
        let sceneStateCancellable = navScene.$current.sink(receiveValue: { [weak self] value in
            guard let self = self, let sceneState = value else { return }
            self.showScene(for: sceneState)
        })
        cancellables.append(sceneStateCancellable)
    }
}

// MARK: Main scene data
extension EmotionCoordinator {
    
    
}
