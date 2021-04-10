//
//  MenuScene.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 08/04/21.
//

import SpriteKit

class MenuScene: SKScene {
    
    let previewLevel: SKSpriteNode = {
        let sprite = SKSpriteNode(imageNamed: "Capa01")
        return sprite
    }()

    let leftButton: ButtonNode = {
        let sprite = ButtonNode(spriteName: "leftButton")
        return sprite
    }()
    
    let rightButton: ButtonNode = {
        let sprite = ButtonNode(spriteName: "rightButton")
        return sprite
    }()
    
    let startGameButton: ButtonNode = {
        let sprite = ButtonNode(spriteName: "StartGame")
        return sprite
    }()

    let levelName: SKLabelNode = {
        let label = SKLabelNode()

        label.attributedText = NSMutableAttributedString(string: "A onça", attributes: [
            NSAttributedString.Key.strokeWidth: -1,
            NSAttributedString.Key.font: UIFont(name: "LoveYaLikeASister-Regular", size: 40)!
        ])

        return label
    }()
    
    let stars: StarsNode = {
        let stars = StarsNode(classification: 2)
        return stars
    }()

    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(named: "backgroundColor")!

        self.configurePreviewView()
        self.configureButtons()
        self.configureLevelNameLabel()
        self.configureStartGamebutton()
        self.configureStars()
    }
}

extension MenuScene {
    private func configurePreviewView() {
        self.addChild(self.previewLevel)
        
        self.previewLevel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
    }
    
    private func configureLevelNameLabel() {
        self.addChild(self.levelName)
        
        let positionY = self.previewLevel.frame.minY - self.levelName.frame.height - 8
        self.levelName.position = CGPoint(x: self.previewLevel.frame.midX, y: positionY)
    }
    
    private func configureButtons() {
        self.addChild(self.leftButton)
        self.addChild(self.rightButton)
        
        let spacing = self.previewLevel.frame.minX-self.leftButton.buttonSprite.frame.width
        self.leftButton.position = CGPoint(x: self.previewLevel.frame.minX-spacing, y: self.frame.midY)

        self.rightButton.position = CGPoint(x: self.previewLevel.frame.maxX+spacing, y: self.frame.midY)
    }
    
    private func configureStartGamebutton() {
        self.addChild(self.startGameButton)

        let positionY = self.levelName.frame.minY - 10 - self.startGameButton.buttonSprite.frame.height/2
        self.startGameButton.position = CGPoint(x: self.previewLevel.frame.midX, y: positionY)
    }
    
    private func configureStars() {
        self.addChild(self.stars)
        
        let paddingHorizontal = self.previewLevel.frame.width/4
        let paddingVertical = self.stars.firstStar.frame.height/2 + 8
        self.stars.firstStar.position = CGPoint(x: self.frame.midX-paddingHorizontal,
                                                y: self.previewLevel.frame.maxY+paddingVertical)

        self.stars.secondStar.position = CGPoint(x: self.frame.midX,
                                                 y: self.previewLevel.frame.maxY+paddingVertical+24)

        self.stars.thirdStar.position = CGPoint(x: self.frame.midX+paddingHorizontal,
                                                y: self.previewLevel.frame.maxY+paddingVertical)
    }
}
