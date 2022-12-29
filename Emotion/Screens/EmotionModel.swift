
import SwiftUI

enum Emotion {
    
    typealias NotesIndex = (Int, Notes)
    
    enum Flow {
        case main
        case addTask
        case onBoarding
        case startScreen
        case stats(items: [Notes])
        case hints
        case changeTask(pair: NotesIndex)
    }
    
    enum Smile: Int, CaseIterable {
        case verySad = 0
        case sad = 1
        case normal = 2
        case happy = 3
        case veryHappy = 4
        
        var id: Int {
            self.rawValue
        }
        
        var image: String {
            switch self {
                case .verySad: return "verySad"
                case .sad: return "sad"
                case .normal: return "normal"
                case .happy: return "happy"
                case .veryHappy: return "veryHappy"
            }
        }
        
        var color: Color {
            switch self {
            case .verySad: return AppColors.verySad
            case .sad: return AppColors.sad
            case .normal: return AppColors.normal
            case .happy: return AppColors.happy
            case .veryHappy: return AppColors.veryHappy
            }
        }
        
        static var smiles: [Smile] {
            Smile.allCases.sorted(by: { $0.id < $1.id })
        }
        
        static func getEmotionFor(id: Int16?) -> Emotion.Smile {
            guard let id = id else { return .normal }
            return Smile.allCases.first(where: { $0.id == id }) ?? .normal
        }
    }
    
}


