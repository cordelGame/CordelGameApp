//
//  AnimationCharacterComponent.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 16/03/21.
//

import SpriteKit
import GameplayKit

class AnimationCharacterComponent: GKComponent {
  let visualComponent: VisualComponent

  init(visualComponent: VisualComponent) {
    self.visualComponent = visualComponent

    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func animateCharacter(typeAnimation: AnimateCharacter) {
    let assetName = visualComponent.assetName
    let stateAsset = SKTexture(imageNamed: "\(assetName)")

    switch typeAnimation {
    case .attack:
      let standardAsset = SKTexture(imageNamed: assetName)

      let attackAction = SKAction.setTexture(stateAsset, resize: true)
      let standartAction = SKAction.setTexture(standardAsset, resize: true)

      let delayAction = SKAction.wait(forDuration: 5)

      let sequence = SKAction.sequence([attackAction, delayAction, standartAction])

      visualComponent.node.run(sequence)
    case .death:
      let deathAction = SKAction.setTexture(stateAsset, resize: true)

      visualComponent.node.run(deathAction)
    }
  }
}
