//
//  TimeBarEntity.swift
//  CordelGame
//
//  Created by Helaine Pontes on 17/03/21.
//

import Foundation
import GameplayKit

class TimeBarEntity: GKEntity {

    init(_ assetName: String) {
        super.init()
        let visualComponent = VisualComponent(assetName: assetName)
        self.addComponent(visualComponent)
        
        let timeComponent = TimeComponent(node: visualComponent.node)
        self.addComponent(timeComponent)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
