//
//  SoundComponent.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 23/03/21.
//

import SpriteKit
import GameplayKit
import AVFoundation

class SoundComponent: GKComponent {
    var sound: AVAudioPlayer!

    func configureSound(soundStyle: TypeSound) {
        let soundFile = soundStyle.soundFile.title
        let soundExtension = soundStyle.soundFile.fileExtension

        let urlString = Bundle.main.path(forResource: soundFile, ofType: soundExtension)

        do {
            guard let urlString = urlString else {
            return
        }
            sound = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            sound.numberOfLoops = (soundStyle == TypeSound.background) ? -1 : 0
            sound.volume = SoundConfiguration.shared.mute ? 0 : 1.0
        } catch {
            print("URL ERROR")
        }
    }

    func playSound() {
        sound.play()
    }

    func pauseSound() {
        sound.pause()
    }

    func changeVolume(volume: Float) {
        sound.volume = SoundConfiguration.shared.mute ? 0 : volume
    }

    func temporaryVolume(volume: Float, duration: TimeInterval) {
        changeVolume(volume: volume)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.changeVolume(volume: 1.0)
        }
    }
}
