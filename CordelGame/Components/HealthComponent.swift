//
//  HealthComponent.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 16/03/21.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
    
    var health: Int
    var kill: (() -> Void)?
    
    init(maxHealth: Int) {
        self.health = maxHealth
        
        super.init()
    }
    
    func hit() {
        if health > 0 {
            health -= 1
        } else {
            health = 0
        }
        _ = notAlive()
    }
    
    func notAlive() -> Bool {
        if health == 0 {
            kill?()
            return true
        }
        return false
    }
    
    func setHelth(newHealth: Int) {
        self.health = newHealth
    }

    required init?(coder: NSCoder) {
        return nil
    }
}
