//
//  GameViewController.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    let gameController: GameController = GameController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }

    private func setup() {
        let scene = self.gameController.handleScene()
        let skView = SKView()

        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        self.view = skView
    }
}
