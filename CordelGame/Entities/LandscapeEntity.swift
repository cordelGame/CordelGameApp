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

//        let soundComponent = SoundComponent()
        let visualComponent = VisualComponent(assetName: assetName)
        
        self.addComponent(visualComponent)
//        self.addComponent(soundComponent)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
