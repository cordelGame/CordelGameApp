//
//  PauseSpriteNode.swift
//  CordelGame
//
//  Created by Helaine Pontes on 09/04/21.
//

import Foundation
import SpriteKit
// swiftlint:disable line_length

class PauseNode: SKNode {
    var gameScene: GamePlayScene
    
    var backgroud = SKSpriteNode(imageNamed: "modal")
    
    var playButton = ButtonNode(spriteName: "playButton")
    
    var homeButton = ButtonNode(spriteName: "homeButton")
    
    var backButton = ButtonNode(spriteName: "backButton")
    
    var soundOnButton = ButtonNode(spriteName: "soundButton")
    
    var soundOffButton = ButtonNode(spriteName: "mutedButton")
    
    init(gameScene: GamePlayScene) {
        self.gameScene = gameScene
        super.init()
        setupNodes()
        setupPlayButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNodes() {
        addChild(backgroud)
        addChild(playButton)
        addChild(soundOnButton)
        addChild(homeButton)
        addChild(backButton)
        addChild(soundOffButton)
        
        let paddingVertical = self.backgroud.frame.height/6
        let paddingHorizontal = self.backgroud.frame.width/3.5
        
        backgroud.position = CGPoint(x: self.gameScene.frame.midX, y: self.gameScene.frame.midY)
        playButton.position = CGPoint(x: self.backgroud.frame.midX, y: self.backgroud.frame.maxY - paddingVertical - self.playButton.buttonSprite.frame.height/2)
        soundOnButton.position = CGPoint(x: self.backgroud.frame.midX, y: self.backgroud.frame.minY + paddingVertical + self.soundOnButton.buttonSprite.frame.height/2)
        soundOffButton.position = CGPoint(x: self.backgroud.frame.midX, y: self.backgroud.frame.minY + paddingVertical + self.soundOffButton.buttonSprite.frame.height/2)
        soundOffButton.isHidden = true
        homeButton.position = CGPoint(x: self.backgroud.frame.midX - paddingHorizontal, y: self.backgroud.frame.minY + (paddingVertical*2) + self.homeButton.buttonSprite.frame.height/2)
        backButton.position = CGPoint(x: self.backgroud.frame.midX + paddingHorizontal, y: self.backgroud.frame.minY + (paddingVertical*2) + self.backButton.buttonSprite.frame.height/2)
    }
    
    func setupPlayButton() {
        self.playButton.wasTapped = {
            self.gameScene.overlay.isHidden = true
            self.isHidden = true
            let time = (self.gameScene.blackBarAction.node.frame.width * 5)/424.0
            self.gameScene.blackBarAction.timeResize(timeDificult: TimeInterval(time))
        }
    }
}
