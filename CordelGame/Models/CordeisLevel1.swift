//
//  CordeisLevel1.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 26/03/21.
//

import Foundation
import UIKit

enum CordeisLevel1 {
    case easy
    case medium
    case hard

    mutating func getLevel() -> Cordel {
        switch self {
        case .easy:
            return Cordel(name: "", winCondition: [""])
        case .medium:
            return Cordel(name: "", winCondition: [""])
        case .hard:
            return Cordel(name: "", winCondition: [""])
        }
    }
}

struct Cordel {
    var name: String
    var winCondition: [String]
}

