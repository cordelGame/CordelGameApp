//
//  GamePlayScene.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import SpriteKit
// swiftlint:disable line_length

class GamePlayScene: SKScene {
    
    let landScape: LandscapeEntity = LandscapeEntity(assetName: "background")
    let cangaceira: CharacterEntity = CharacterEntity(assetName: "personagem", health: 1)
    let enemy: CharacterEntity = CharacterEntity(assetName: "cobra", health: 2)
    let blackBar: TimeBarEntity = TimeBarEntity("blackBar")
    let rectangle: TimeBarEntity = TimeBarEntity("rectangle")
    let drawingControl: DrawingControlEntity = DrawingControlEntity()

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = UIColor(named: "backgroundColor")!
        
        guard let landScapeSprite = landScape.component(ofType: VisualComponent.self) else {fatalError()}
        guard let cangaceiraSprite = cangaceira.component(ofType: VisualComponent.self) else {fatalError()}
        guard let enemySprite = enemy.component(ofType: VisualComponent.self) else {fatalError()}
        guard let blackBarSprite = blackBar.component(ofType: VisualComponent.self) else {fatalError()}
        guard let rectangleSprite = rectangle.component(ofType: VisualComponent.self) else {fatalError()}
        
        self.addChild(landScapeSprite.node)
        self.addChild(enemySprite.node)
        self.addChild(cangaceiraSprite.node)

        self.addChild(drawingControl.controlVisualComponent.node)
        self.addChild(drawingControl.button1VisualComponent.node)
        self.addChild(drawingControl.button2VisualComponent.node)
        self.addChild(drawingControl.button3VisualComponent.node)
        self.addChild(drawingControl.button4VisualComponent.node)
        
        self.addChild(rectangleSprite.node)
        self.addChild(blackBarSprite.node)
        
        landScapeSprite.node.anchorPoint = CGPoint(x: 0, y: 1)
        landScapeSprite.node.position = CGPoint(x: self.frame.minX, y: self.frame.maxY)
        landScapeSprite.node.size = CGSize(width: self.frame.width, height: self.frame.height/2)
        
        cangaceiraSprite.node.anchorPoint = CGPoint(x: 0, y: 0)
        cangaceiraSprite.node.position = CGPoint(x: landScapeSprite.node.frame.minX + 30, y: landScapeSprite.node.frame.minY + 5)
        cangaceiraSprite.node.size.width = self.frame.width * 0.24532
        cangaceiraSprite.node.size.height = self.frame.height * 0.31749
        
        enemySprite.node.anchorPoint = CGPoint(x: 1, y: 0)
        enemySprite.node.position = CGPoint(x: landScapeSprite.node.frame.maxX - 5, y: landScapeSprite.node.frame.minY + 5)
        enemySprite.node.size.width = self.frame.width * 0.6658
        enemySprite.node.size.height = self.frame.height * 0.1814
        
        rectangleSprite.node.anchorPoint = CGPoint(x: 0, y: 1)
        rectangleSprite.node.position = CGPoint(x: self.frame.minX, y: landScapeSprite.node.frame.minY)
        rectangleSprite.node.size.width = self.frame.width
        
        blackBarSprite.node.anchorPoint = CGPoint(x: 0, y: 0.5)
        blackBarSprite.node.position = CGPoint(x: rectangleSprite.node.frame.minX, y: rectangleSprite.node.frame.midY)
        blackBarSprite.node.size.width = self.frame.width
        
        drawingControl.controlVisualComponent.node.anchorPoint = CGPoint(x: 0.5, y: 1)
        drawingControl.controlVisualComponent.node.position = CGPoint(x: rectangleSprite.node.frame.midX, y: landScapeSprite.node.frame.minY-5)
        drawingControl.controlVisualComponent.node.size.width = self.frame.width
        drawingControl.controlVisualComponent.node.size.height = drawingControl.controlVisualComponent.node.size.width
                
        let positionXButtonOne = drawingControl.controlVisualComponent.node.frame.midX - (drawingControl.controlVisualComponent.node.size.width/4) - drawingControl.button1VisualComponent.node.frame.width/4
        drawingControl.button1VisualComponent.node.position = CGPoint(x: positionXButtonOne, y: drawingControl.controlVisualComponent.node.frame.midY)
        
        let positionYButtonTwo = drawingControl.controlVisualComponent.node.frame.midY + ((drawingControl.controlVisualComponent.node.size.height/4)) + drawingControl.button2VisualComponent.node.frame.width/4
        drawingControl.button2VisualComponent.node.position = CGPoint(x: drawingControl.controlVisualComponent.node.frame.midX, y: positionYButtonTwo)
        
        let positionXButtonThree = drawingControl.controlVisualComponent.node.frame.midX + (drawingControl.controlVisualComponent.node.size.width/4) + drawingControl.button3VisualComponent.node.frame.width/4
        drawingControl.button3VisualComponent.node.position = CGPoint(x: positionXButtonThree, y: drawingControl.controlVisualComponent.node.frame.midY)

        let positionYButtonFour = drawingControl.controlVisualComponent.node.frame.midY - ((drawingControl.controlVisualComponent.node.size.height/4)) - drawingControl.button4VisualComponent.node.frame.width/4
        drawingControl.button4VisualComponent.node.position = CGPoint(x: drawingControl.controlVisualComponent.node.frame.midX, y: positionYButtonFour)
    }
}
