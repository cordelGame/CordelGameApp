//
//  ButtonNode.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 09/04/21.
//

import SpriteKit

class ButtonNode: SKNode {
    
    var buttonSprite: SKSpriteNode
    var wasTapped: (() -> Void)?

    init(spriteName: String) {
        self.buttonSprite = SKSpriteNode(imageNamed: spriteName)
        
        super.init()

        self.addChild(self.buttonSprite)
        self.isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.buttonSprite.setScale(0.9)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.buttonSprite.setScale(1.0)
        self.wasTapped?()
    }
}
