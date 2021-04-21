//
//  GameManager.swift
//  CordelGame
//
//  Created by Helaine Pontes on 05/04/21.
//
// 0 erros: 3 estrelas, 5 ou menos erros: 2 estrelas, 6 ou mais erros 1 estrela

import Foundation

class GameManager {
    var currentEnemy: Enemy!
    var enemies: EnemyLevel
    var currentCordel: Cordel!
    var failures: Int = 0
    var gameOver = false

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
        if !gameOver {
            let check = self.currentCordel.winCondition.contains(userInput)

            if !check {
                self.failure()
            }

            return check
        }
        return !gameOver
    }
    
    func failure() {
        self.failures += 1
    }

    func getScore() -> Int {
        switch self.failures {
        case 0:
            return 3
        case 1...5:
            return 2
        case let num where num > 5:
            return 1
        default:
            return 0
        }
    }
    
    func saveScore() -> Int {
        let points = UserDefaults.standard.integer(forKey: "points")
        let score =  self.getScore()
        if score > points {
            UserDefaults.standard.setValue(score, forKey: "points")
        }
        return score
    }
}
