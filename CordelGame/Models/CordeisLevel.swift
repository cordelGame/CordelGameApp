//
//  CordeisLevel1.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 26/03/21.
//

import Foundation
import UIKit

enum CordeisLevel {
    case easy
    case medium
    case hard

    mutating func getCordel() -> Cordel {
        switch self {
        case .easy:
            let index = Int.random(in: 0..<CordeisData.easy.count)
            return CordeisData.easy[index]
        case .medium:
            let index = Int.random(in: 0..<CordeisData.medium.count)
            return CordeisData.medium[index]
        case .hard:
            let index = Int.random(in: 0..<CordeisData.hard.count)
            return CordeisData.hard[index]
        }
    }
}

struct Cordel {
    var name: String
    var winCondition: [[String]]
}
