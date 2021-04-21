//
//  VisualComponent.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import SpriteKit
import GameplayKit

class VisualComponent: GKComponent {
    var node: SKSpriteNode
    let assetName: String

    init(assetName: String) {
        node = SKSpriteNode(imageNamed: assetName)
        self.assetName = assetName

        super.init()
    }

    func changeAsset(assetName: String) {
        let newAsset = SKTexture(imageNamed: assetName)

        let changeAssetAction = SKAction.setTexture(newAsset, resize: true)
        node.run(changeAssetAction)
    }

    required init?(coder: NSCoder) {
        return nil
    }
}
