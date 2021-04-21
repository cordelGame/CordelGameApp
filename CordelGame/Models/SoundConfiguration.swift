//
//  SoundConfiguration.swift
//  CordelGame
//
//  Created by José João Silva Nunes Alves on 20/04/21.
//

import Foundation

class SoundConfiguration {
    static let shared = SoundConfiguration()

    var mute: Bool = false
    
    var backgroundSound: SoundComponent = {
        let soundComponent = SoundComponent()
        return soundComponent
    }()
}
