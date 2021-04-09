//
//  GameController.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import Foundation
import SpriteKit

class GameController {
    func handleScene() -> SKScene {
        return GamePlayScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        return MenuScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
    }
}

enum ScreenSize {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}
