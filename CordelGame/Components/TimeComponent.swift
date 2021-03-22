//
//  TimeComponent.swift
//  CordelGame
//
//  Created by Helaine Pontes on 18/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class TimeComponent: GKComponent {
    let node: SKSpriteNode
    var animationStopRun: (() -> Void)?
    
    init(node: SKSpriteNode) {
        self.node = node
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func timeResize(timeDificult: TimeInterval) {
        let resize = SKAction.resize(toWidth: 0, duration: timeDificult)
        node.run(resize) {
            self.animationStopRun?()
        }
    }
    
    func stop () {
        node.removeAllActions()
    }
}
