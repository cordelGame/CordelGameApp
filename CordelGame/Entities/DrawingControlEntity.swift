//
//  DrawingControlEntity.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 16/03/21.
//

import GameplayKit

class DrawingControlEntity: GKEntity {

    let controlVisualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "control")
        return visualComponent
    }()

    let button1VisualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "botao")
        return visualComponent
    }()

    let button2VisualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "botao")
        return visualComponent
    }()

    let button3VisualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "botao")
        return visualComponent
    }()

    let button4VisualComponent: VisualComponent = {
        let visualComponent = VisualComponent(assetName: "botao")
        return visualComponent
    }()

    override init() {
        super.init()

        self.addComponent(controlVisualComponent)
        self.addComponent(button1VisualComponent)
        self.addComponent(button2VisualComponent)
        self.addComponent(button3VisualComponent)
        self.addComponent(button4VisualComponent)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
