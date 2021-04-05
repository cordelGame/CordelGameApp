//
//  GameManager.swift
//  CordelGame
//
//  Created by Helaine Pontes on 05/04/21.
//

import Foundation

class GameManager {
    var currentEnemy: Enemy!
    var enemies: EnemyLevel
    var currentCordel: Cordel!
    
    init(enemyLevel: EnemyLevel) {
        self.enemies = enemyLevel
    }
    
    func getEnemy() -> Enemy {
        let enemy = self.enemies.getEnemy()
        self.currentEnemy = enemy
        return enemy
    }
    
    func getCordel() -> Cordel {
        self.currentCordel = self.currentEnemy.cordeis.getCordel()
        return self.currentCordel
    }
    
    func checkWinCondition(userInput: [String]) -> Bool {
        return self.currentCordel.winCondition.contains(userInput)
    }
}
