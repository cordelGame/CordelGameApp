//
//  FinishNode.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 21/04/21.
//

import Foundation
import SpriteKit

class FinishNode: SKNode {
    var gameScene: GamePlayScene
    
    var backgroud = SKSpriteNode(imageNamed: "modal")
    
    var homeButton = ButtonNode(spriteName: "homeButton")
    
    var restartButton = ButtonNode(spriteName: "backButton")
    
    let label = SKLabelNode()
    var win = false
    
    init(gameScene: GamePlayScene) {
        self.gameScene = gameScene
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureFinishNodes(win: Bool) {
        setupNodes()
        setupHomeButton()
        setupRestartButton()
        setupLabel(win: win)
    }
    
    func setupNodes() {
        self.gameScene.overlay.isHidden = false
        addChild(backgroud)
        addChild(homeButton)
        addChild(restartButton)
        
        backgroud.position = CGPoint(x: self.gameScene.frame.midX, y: self.gameScene.frame.midY)
        homeButton.position = CGPoint(x: self.gameScene.frame.midX-47, y: self.gameScene.frame.midY-68)
        restartButton.position = CGPoint(x: (self.gameScene.frame.midX+47), y: (self.gameScene.frame.midY-68))
    }
    
    private func setupHomeButton() {
        self.homeButton.wasTapped = {
            self.gameScene.removeAllChildren()
            self.gameScene.navigationDelegate?.navigate(to: .menu)
        }
    }
    
    private func setupRestartButton() {
        self.restartButton.wasTapped = {
            self.gameScene.navigationDelegate?.navigate(to: .game)
        }
    }
    
    func setupLabel(win: Bool) {
        if win {
            label.attributedText = NSMutableAttributedString(string: "Você Ganhou", attributes: [
                NSAttributedString.Key.strokeWidth: -1,
                NSAttributedString.Key.font: UIFont(name: "LoveYaLikeASister-Regular", size: 45)!
            ])
            label.position = CGPoint(x: self.gameScene.frame.midX, y: self.gameScene.frame.midY+108)
            configureStars()
            
        } else {
            label.attributedText = NSMutableAttributedString(string: "Você Perdeu", attributes: [
                NSAttributedString.Key.strokeWidth: -1,
                NSAttributedString.Key.font: UIFont(name: "LoveYaLikeASister-Regular", size: 45)!
            ])
            label.position = CGPoint(x: self.gameScene.frame.midX, y: self.gameScene.frame.midY+60)
        }
        addChild(label)
    }
    
    private func configureStars() {
        let stars: StarsNode = {
            let stars = StarsNode(classification: self.gameScene.gameManager.saveScore())
            return stars
        }()
        self.addChild(stars)

        let paddingHorizontal = self.backgroud.frame.width/4
        let paddingVertical = stars.firstStar.frame.height/2 + 8
        stars.firstStar.position = CGPoint(x: self.gameScene.frame.midX-paddingHorizontal,
                                                y: self.backgroud.frame.midY+paddingVertical)

        stars.secondStar.position = CGPoint(x: self.gameScene.frame.midX,
                                                 y: self.backgroud.frame.midY+paddingVertical+24)

        stars.thirdStar.position = CGPoint(x: self.gameScene.frame.midX+paddingHorizontal,
                                                y: self.backgroud.frame.midY+paddingVertical)
    }
}
