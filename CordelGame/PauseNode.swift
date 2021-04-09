//
//  PauseSpriteNode.swift
//  CordelGame
//
//  Created by Helaine Pontes on 09/04/21.
//

import Foundation
import SpriteKit

class PauseNode: SKNode {
    var gameScene: GamePlayScene
    
    var backgroud: SKSpriteNode = {
        var background = SKSpriteNode(imageNamed: "modal")
        return background
    }()
    
    var playButton: SKSpriteNode = {
        var playButton = SKSpriteNode(imageNamed: "playButton")
        return playButton
    }()
    
    init(gameScene: GamePlayScene) {
        self.gameScene = gameScene
        super.init()
        setupNodes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNodes() {
        addChild(backgroud)
        addChild(playButton)
        
        backgroud.position = CGPoint(x: self.gameScene.frame.midX, y: self.gameScene.frame.midY)
        playButton.position = CGPoint(x: self.backgroud.frame.midX, y: self.backgroud.frame.midY)
    }
}
