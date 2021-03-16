//
//  VisualComponent.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import SpriteKit
import GameplayKit

class VisualComponent: GKComponent {
    let node: SKSpriteNode

    init(assetName: String) {
        node = SKSpriteNode(imageNamed: assetName)

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
