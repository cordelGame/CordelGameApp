//
//  EnemiesLevel1.swift
//  CordelGame
//
//  Created by Helaine Pontes on 23/03/21.
//

import Foundation
import UIKit

enum EnemiesLevel1: EnemyLevel {
    case calango
    case carcara
    case cobra
    case onca

    mutating func getEnemy() -> Enemy {
        switch self {
        case .calango:
            self = .carcara
            return Enemy(name: "Calango(1)", widthMultiplier: 0.33, heightMultiplier: 0.24,
                         positionX: -5, positionY: 5, health: 2, sound: .calango, cordeis: .easy)
        case .carcara:
            self = .cobra
            return Enemy(name: "Carcara(1)", widthMultiplier: 0.26, heightMultiplier: 0.19,
                         positionX: -5, positionY: 5, health: 2, sound: .carcara, cordeis: .easy)
        case .cobra:
            self = .onca
            return Enemy(name: "Cobra(1)", widthMultiplier: 0.66, heightMultiplier: 0.18,
                         positionX: -5, positionY: 5, health: 2, sound: .cobra, cordeis: .medium)
        case .onca:
            self = .onca
            return Enemy(name: "Onca(1)", widthMultiplier: 0.64, heightMultiplier: 0.28,
                         positionX: 100, positionY: 5, health: 4, sound: .onca, cordeis: .hard)
        }
    }
}

struct Enemy {
    var name: String
    var widthMultiplier: CGFloat
    var heightMultiplier: CGFloat
    var positionX: CGFloat
    var positionY: CGFloat
    var health: Int
    var sound: TypeSound
    var cordeis: CordeisLevel
}

protocol EnemyLevel {
    mutating func getEnemy() -> Enemy
}
