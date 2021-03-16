//
//  LandscapeEntity.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import GameplayKit

class LandscapeEntity: GKEntity {

    let visualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "background")
        return visualComponent
    }()

    override init() {
        super.init()
        self.addComponent(self.visualComponent)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
