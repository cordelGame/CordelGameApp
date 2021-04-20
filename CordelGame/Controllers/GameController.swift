//
//  GameController.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import Foundation
import SpriteKit

class GameController {

    var handleUpdate: (() -> Void)?

    var nextScene: ScenesEnum = .menu {
        didSet {
            self.handleUpdate?()
        }
    }

    func handleScene() -> SKScene {
        let scene: SKScene

        switch self.nextScene {
        case .menu:
            let gameScene = MenuScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
            gameScene.navigationDelegate = self
            scene = gameScene
        case .game:
            let gameScene = GamePlayScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
            scene = gameScene
        }
        
        return scene
    }
}

enum ScreenSize {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

extension GameController: Navigation {
    func navigate(to scene: ScenesEnum) {
        self.nextScene = scene
    }
}
