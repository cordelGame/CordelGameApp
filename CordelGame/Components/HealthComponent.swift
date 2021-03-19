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
  }

  func isAlive() -> Bool {
    if health != 0 {
      return true
    }
    return false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
