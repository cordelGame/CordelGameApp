//
//  LandscapeEntity.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import GameplayKit

class LandscapeEntity: GKEntity {

    init(assetName: String) {
        super.init()
        
        let visualComponent = VisualComponent(assetName: assetName)
        self.addComponent(visualComponent)
    }

    required init?(coder: NSCoder) {
        return nil
    }
}
