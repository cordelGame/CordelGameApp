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
    let cangaceira: CharacterEntity = CharacterEntity(assetName: "Cangaceira(1)", health: 1)
    
    lazy var enemy: CharacterEntity = {
        let configEnemy = self.enemyLevel.getEnemy()
        var characterEntity = CharacterEntity(assetName: configEnemy.name, health: configEnemy.health)

        guard let enemySprite = characterEntity.component(ofType: VisualComponent.self) else {fatalError()}

        enemySprite.node.anchorPoint = CGPoint(x: 1, y: 0)
        enemySprite.node.size.width = self.frame.width * configEnemy.widthMultiplier
        enemySprite.node.size.height = self.frame.height * configEnemy.heightMultiplier

        return characterEntity
    }()
    
    let cordelEntity = CordelEntity(assetName: "Cordel")

    var cordelVisualComponent: VisualComponent {
        return cordelEntity.component(ofType: VisualComponent.self)!
    }

    var cangaceiraHelthComponent: HealthComponent {
        return cangaceira.component(ofType: HealthComponent.self)!
    }

    var enemyVisualComponent: VisualComponent {
        return enemy.component(ofType: VisualComponent.self)!
    }

    var enemyHelthComponent: HealthComponent {
        return enemy.component(ofType: HealthComponent.self)!
    }

    let blackBar: TimeBarEntity = TimeBarEntity("blackBar")
    let rectangle: TimeBarEntity = TimeBarEntity("rectangle")
    let drawingControl: DrawingControlEntity = DrawingControlEntity()
    
    let victoyCondition = ["button1", "button2", "button3", "button4"]
    var testerVictory: [String] = []
    var enemyLevel: EnemiesLevel1 = .calango
    
    var button1 = SKSpriteNode()
    var button2 = SKSpriteNode()
    var button3 = SKSpriteNode()
    var button4 = SKSpriteNode()
    
    var initialPoint = CGPoint()
    var finalPoint = CGPoint()
    var shape = SKShapeNode()

    func nextEnemy() {
        let configEnemy = self.enemyLevel.getEnemy()
        
        self.enemyVisualComponent.changeAsset(assetName: configEnemy.name)
        self.enemyVisualComponent.node.anchorPoint = CGPoint(x: 1, y: 0)
        self.enemyVisualComponent.node.size.width = self.frame.width * configEnemy.widthMultiplier
        self.enemyVisualComponent.node.size.height = self.frame.height * configEnemy.heightMultiplier
        
        self.enemyHelthComponent.setHelth(newHealth: configEnemy.health)
    }

    override func didMove(to view: SKView) {
        self.view?.showsNodeCount = true
        super.didMove(to: view)
        self.backgroundColor = UIColor(named: "backgroundColor")!
    
        guard let landScapeSprite = landScape.component(ofType: VisualComponent.self) else {fatalError()}
        guard let cangaceiraSprite = cangaceira.component(ofType: VisualComponent.self) else {fatalError()}

        guard let blackBarSprite = blackBar.component(ofType: VisualComponent.self) else {fatalError()}
        guard let rectangleSprite = rectangle.component(ofType: VisualComponent.self) else {fatalError()}
        
        self.addChild(landScapeSprite.node)
        self.addChild(enemyVisualComponent.node)
        self.addChild(cangaceiraSprite.node)

        self.addChild(drawingControl.controlVisualComponent.node)
        self.addChild(drawingControl.button1VisualComponent.node)
        self.addChild(drawingControl.button2VisualComponent.node)
        self.addChild(drawingControl.button3VisualComponent.node)
        self.addChild(drawingControl.button4VisualComponent.node)
        
        self.addChild(rectangleSprite.node)
        self.addChild(blackBarSprite.node)
        self.addChild(self.cordelVisualComponent.node)

        guard let blackBarAction = blackBar.component(ofType: TimeComponent.self) else { return }
        blackBarAction.timeResize(timeDificult: 5)
        
        blackBarAction.animationStopRun = self.gameOver

        button1 = drawingControl.button1VisualComponent.node
        button2 = drawingControl.button2VisualComponent.node
        button3 = drawingControl.button3VisualComponent.node
        button4 = drawingControl.button4VisualComponent.node
        
        landScapeSprite.node.anchorPoint = CGPoint(x: 0, y: 1)
        landScapeSprite.node.position = CGPoint(x: self.frame.minX, y: self.frame.maxY)
        landScapeSprite.node.size = CGSize(width: self.frame.width, height: self.frame.height/2)
        
        cangaceiraSprite.node.anchorPoint = CGPoint(x: 0, y: 0)
        cangaceiraSprite.node.position = CGPoint(x: landScapeSprite.node.frame.minX + 30, y: landScapeSprite.node.frame.minY + 5)
        cangaceiraSprite.node.size.width = self.frame.width * 0.3691
        cangaceiraSprite.node.size.height = self.frame.height * 0.3196
        
        enemyVisualComponent.node.position = CGPoint(x: landScapeSprite.node.frame.maxX - 5, y: landScapeSprite.node.frame.minY + 5)
        
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
        drawingControl.button1VisualComponent.node.name = "button1"
        
        let positionYButtonTwo = drawingControl.controlVisualComponent.node.frame.midY + ((drawingControl.controlVisualComponent.node.size.height/4)) + drawingControl.button2VisualComponent.node.frame.width/4
        drawingControl.button2VisualComponent.node.position = CGPoint(x: drawingControl.controlVisualComponent.node.frame.midX, y: positionYButtonTwo)
        drawingControl.button2VisualComponent.node.name = "button2"
        
        let positionXButtonThree = drawingControl.controlVisualComponent.node.frame.midX + (drawingControl.controlVisualComponent.node.size.width/4) + drawingControl.button3VisualComponent.node.frame.width/4
        drawingControl.button3VisualComponent.node.position = CGPoint(x: positionXButtonThree, y: drawingControl.controlVisualComponent.node.frame.midY)
        drawingControl.button3VisualComponent.node.name = "button3"

        let positionYButtonFour = drawingControl.controlVisualComponent.node.frame.midY - ((drawingControl.controlVisualComponent.node.size.height/4)) - drawingControl.button4VisualComponent.node.frame.width/4
        drawingControl.button4VisualComponent.node.position = CGPoint(x: drawingControl.controlVisualComponent.node.frame.midX, y: positionYButtonFour)
        drawingControl.button4VisualComponent.node.name = "button4"
        
        self.cordelVisualComponent.node.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.cordelVisualComponent.node.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 50)

        shape.strokeColor = .black
        shape.lineWidth = 8
        addChild(shape)
        shape.name = "shape"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.location(in: self)
            let nodes = self.nodes(at: position)
            if nodes[0].name?.contains("button1") ?? false {
                initialPoint = CGPoint(x: button1.frame.midX, y: button1.frame.midY)
                self.testerVictory.append("button1")
                self.tapped()
            }
            if nodes[0].name?.contains("button2") ?? false {
                initialPoint = CGPoint(x: button2.frame.midX, y: button2.frame.midY)
                self.testerVictory.append("button2")
                self.tapped()
            }
            if nodes[0].name?.contains("button3") ?? false {
                initialPoint = CGPoint(x: button3.frame.midX, y: button3.frame.midY)
                self.testerVictory.append("button3")
                self.tapped()
            }
            if nodes[0].name?.contains("button4") ?? false {
                initialPoint = CGPoint(x: button4.frame.midX, y: button4.frame.midY)
                self.testerVictory.append("button4")
                self.tapped()
            }
        }
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if checkPosition() {
            let path = CGMutablePath()
            path.move(to: initialPoint)
            
            if let touch = touches.first {
                let position = touch.location(in: self)
                let nodes = self.nodes(at: position)
                finalPoint = position
                if nodes[0].name?.contains("button1") ?? false {
                    if initialPoint != CGPoint(x: button1.frame.midX, y: button1.frame.midY) {
                        finalPoint = CGPoint(x: button1.frame.midX, y: button1.frame.midY)
                        self.addLine(initialPoint: initialPoint, finalPoint: finalPoint)
                        self.testerVictory.append("button1")
                        initialPoint = CGPoint(x: button1.frame.midX, y: button1.frame.midY)
                        self.tapped()
                    }
                    
                } else if nodes[0].name?.contains("button2") ?? false {
                    if initialPoint != CGPoint(x: button2.frame.midX, y: button2.frame.midY) {
                        finalPoint = CGPoint(x: button2.frame.midX, y: button2.frame.midY)
                        self.addLine(initialPoint: initialPoint, finalPoint: finalPoint)
                        self.testerVictory.append("button2")
                        initialPoint = CGPoint(x: button2.frame.midX, y: button2.frame.midY)
                        self.tapped()
                    }
                } else if nodes[0].name?.contains("button3") ?? false {
                    if initialPoint != CGPoint(x: button3.frame.midX, y: button3.frame.midY) {
                        finalPoint = CGPoint(x: button3.frame.midX, y: button3.frame.midY)
                        self.addLine(initialPoint: initialPoint, finalPoint: finalPoint)
                        self.testerVictory.append("button3")
                        initialPoint = CGPoint(x: button3.frame.midX, y: button3.frame.midY)
                        self.tapped()
                    }
                } else if nodes[0].name?.contains("button4") ?? false {
                    if initialPoint != CGPoint(x: button4.frame.midX, y: button4.frame.midY) {
                        finalPoint = CGPoint(x: button4.frame.midX, y: button4.frame.midY)
                        self.addLine(initialPoint: initialPoint, finalPoint: finalPoint)
                        self.testerVictory.append("button4")
                        initialPoint = CGPoint(x: button4.frame.midX, y: button4.frame.midY)
                        self.tapped()
                    }
                    
                }
                path.addLine(to: finalPoint)
                shape.path = path
                
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if checkPosition() {
            shape.path = nil
            shape.removeAllChildren()
        }
    
        guard let blackBarAction = blackBar.component(ofType: TimeComponent.self) else { return }
    
        if self.checkVictory() {
            blackBarAction.stop(width: self.frame.width)
            enemyHelthComponent.hit()

            if enemyHelthComponent.notAlive() {
                self.nextEnemy()
            }
            blackBarAction.timeResize(timeDificult: 5)
        }
    }
    
    func checkPosition() -> Bool {
        let pos1 = CGPoint(x: button1.frame.midX, y: button1.frame.midY)
        let pos2 = CGPoint(x: button2.frame.midX, y: button2.frame.midY)
        let pos3 = CGPoint(x: button3.frame.midX, y: button3.frame.midY)
        let pos4 = CGPoint(x: button4.frame.midX, y: button4.frame.midY)
        
        if initialPoint == pos1 || initialPoint == pos2 || initialPoint == pos3 || initialPoint == pos4 {
            return true
        }
        return false
    }

    func addLine(initialPoint: CGPoint, finalPoint: CGPoint) {
        let line = SKShapeNode()
        line.strokeColor = .black
        line.lineWidth = 8
        
        let path = CGMutablePath()
        path.move(to: initialPoint)
        path.addLine(to: finalPoint)
        line.path = path
        shape.addChild(line)
        line.name = "line"
        
    }
    
    func checkVictory() -> Bool {
        if victoyCondition == testerVictory || victoyCondition.reversed() == testerVictory { // To do: deixar generico
            testerVictory = []
            return true
        }
        testerVictory = []
        return false
    }
    
    func gameOver() {
        cangaceiraHelthComponent.hit()
        // tela de gameOver
    }

    func tapped() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
