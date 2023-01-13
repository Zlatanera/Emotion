

import Foundation
import Combine
import SwiftUI

class EmotionCoordinator: ObservableObject, CoordinatorSwiftUI {
    
    @Published var currentScene: AnyView = AnyView(EmptyView())
    @Published var items: [Notes] = []
    @Published var categories: [Categories] = []
    
    @Published var isShowingMailView = false
    
    //Published для списка
    
    internal var data: DataManager = DataManager.shared
    internal var cancellables: [AnyCancellable] = []
    internal var navScene = NavigationControllerGeneric<Emotion.Flow>()
    internal var navCoordinator: NavigatorSwiftUI
    
    init(navigator: NavigatorSwiftUI) {
        self.navCoordinator = navigator
        setupCoordinator()
        setupBindings()
        setupItems()
        setupCategories()
        self.start()
    }
    
    private func setupCoordinator() {
        navCoordinator.push(self)
    }
    
    func start() {
        showStart()
    }
    
    func setupItems() {
        data.getNotes { items in
            self.items = items
        }
    }
    
    func setupCategories() {
        data.getCategories { categories in
            self.categories = categories
        }
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
        case .addTask: currentScene = AnyView(AddTaskView().environmentObject(self))
        case .onBoarding: currentScene = AnyView(OnBoardingView().environmentObject(self))
        case .startScreen: currentScene = AnyView(StartView(endAnimation: true).environmentObject(self))
        case .stats(let items): currentScene = AnyView(StatsView(items: items).environmentObject(self))
        case .categories: currentScene = AnyView(CategoriesView().environmentObject(self))
        case .hints: currentScene = AnyView(HintsView(notes: items).environmentObject(self))
        case .changeTask(let pair): currentScene = AnyView(ChangeTaskView(changePair: pair).environmentObject(self))
        }
    }
    
    func showMain() {
        navScene.push(.main)
    }
    
    func showAddTask() {
        navScene.push(.addTask)
    }
    
    func showOnBoarding() {
        navScene.push(.onBoarding)
    }
    
    func showStart() {
        navScene.push(.startScreen)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if UserDefaults.onboardingPassed {
                self?.showMain()
            } else {
                UserDefaults.onboardingPassed = true
                self?.showOnBoarding()
            }
        }
    }
    
    func showStats() {
        navScene.push(.stats(items: items))
    }
    
    func showHints() {
        navScene.push(.hints)
    }
    
    func showMail() {
        isShowingMailView = true
    }
    
    func showCategories() {
        navScene.push(.categories(items: categories))
    }
    
    func changeTask(pair: Emotion.NotesIndex) {
        navScene.push(.changeTask(pair: pair))
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
    
    func delete(at offsets: IndexSet) {
        var deleteItems: [Notes] = []
        offsets.forEach({ deleteItems.append(items[$0]) })
        data.delete(items: deleteItems) { isOK in
            if isOK {
                self.items = items.filter({ !deleteItems.contains($0) })
            } 
        }
    }
    
    func saveTaskToDB(description: String, category: Categories?, emotion: Emotion.Smile) {
        data.addTask(for: AddTask.forDB(emotion: emotion, description: description, category: category), completion: {
            guard let item = $0 else { return }
            DispatchQueue.main.async {
                self.items.append(item)
            }
        })
    }
    
    func updateTaskInDB(description: String, category: Categories?, emotion: Emotion.Smile, pair: Emotion.NotesIndex) {
        data.updateTask(for: AddTask.forDB(emotion: emotion, description: description, category: category), item: pair.1, completion: {
            guard let item = $0 else { return }
            DispatchQueue.main.async {
                self.items[pair.0] = item
            }
        })
    }
    
    func addCategory(_ title: String) {
        data.addCategory(for: title) { category in
            guard let category = category else { return }
            self.categories.append(category)
        }
    }
}


