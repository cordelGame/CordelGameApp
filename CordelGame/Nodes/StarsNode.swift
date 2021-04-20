//
//  StarsNode.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 09/04/21.
//

import SpriteKit

class StarsNode: SKNode {

    let classification: Int

    lazy var firstStar: SKSpriteNode  = {
        let nameSprite = self.classification >= 1 ? "starOneFill": "starOne"
        let sprite = SKSpriteNode(imageNamed: nameSprite)
        return sprite
    }()

    lazy var secondStar: SKSpriteNode  = {
        let nameSprite = self.classification >= 2 ? "starTwoFill": "starTwo"
        let sprite = SKSpriteNode(imageNamed: nameSprite)
        return sprite
    }()
    
    lazy var thirdStar: SKSpriteNode  = {
        let nameSprite = self.classification >= 3 ? "starThreeFill": "starThree"
        let sprite = SKSpriteNode(imageNamed: nameSprite)
        return sprite
    }()

    init(classification: Int) {
        self.classification = classification
        super.init()
        self.setupStars()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStars() {
        self.addChild(firstStar)
        self.addChild(secondStar)
        self.addChild(thirdStar)
    }
}
