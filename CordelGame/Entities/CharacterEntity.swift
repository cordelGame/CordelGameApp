//
//  CharacterEntity.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 16/03/21.
//

import SpriteKit
import GameplayKit

class CharacterEntity: GKEntity {

  init(assetName: String, health: Int, sound: TypeSound) {
    super.init()

    let visualComponent = VisualComponent(assetName: assetName)
    let healthComponent = HealthComponent(maxHealth: health)
    let animationComponent = AnimationCharacterComponent(visualComponent: visualComponent)
    let soundComponent = SoundComponent()

    healthComponent.kill = deathCharacter

    self.addComponent(visualComponent)
    self.addComponent(healthComponent)
    self.addComponent(animationComponent)
    self.addComponent(soundComponent)
  }

  func deathCharacter () {
    if let animationComponent = self.component(ofType: AnimationCharacterComponent.self) {
      animationComponent.animateCharacter(typeAnimation: .death)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
