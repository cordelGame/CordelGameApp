//
//  GameViewController.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let skView = SKView()
    lazy var gameController: GameController = {
        let gameController = GameController()
    
        gameController.handleUpdate = {
            let scene = self.gameController.handleScene()
            scene.scaleMode = .aspectFill
            self.skView.presentScene(scene)
        }
        
        return gameController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
        
        SoundConfiguration.shared.backgroundSound.configureSound(soundStyle: .background)
        SoundConfiguration.shared.backgroundSound.playSound()
    }

    private func setup() {
        let scene = self.gameController.handleScene()
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        self.view = skView
    }
}
