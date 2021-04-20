//
//  DrawComponent.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 26/03/21.
//

import UIKit
import GameplayKit

class DrawComponent: GKComponent {
    let visualComponent: VisualComponent

    init(visualComponent: VisualComponent) {
      self.visualComponent = visualComponent

      super.init()
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
