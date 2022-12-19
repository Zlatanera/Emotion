//
//  MainViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.10.2022.
//

import Foundation
import MessageUI
import Combine

class MainViewModel: ObservableObject {
    
    @Published var mailResult: Result<MFMailComposeResult, Error>? = nil
    
    // MARK: Bindable
    internal var cancellables: Set<AnyCancellable> = []
    
    init() {
        $mailResult
            .dropFirst()
            .sink { res in
                
                guard let res = res else { return }
        
                switch res {
                case .success(let data): print(data)
                case .failure(let error): print(error)
                
                }
            }
            .store(in: &cancellables)
        
    }
    
    deinit {
        cancellables.forEach({ $0.cancel() })
        cancellables = []
    }
    
}
