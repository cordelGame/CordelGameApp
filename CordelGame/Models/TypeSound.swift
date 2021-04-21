//
//  TypeSound.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 24/03/21.
//

import Foundation

enum TypeSound {
  case background
  case hit
  case shot
  case knife
  case gameOver
  case win
  case onca
  case calango
  case cobra
  case soim
  case carcara
  case corruptedFile
  case nullURL

  var soundFile: AudioFile {
    switch self {
    case .background:
      return AudioFile(title: "background", fileExtension: "mp3")
    case .hit:
      return AudioFile(title: "hit", fileExtension: "wav")
    case .shot:
      return AudioFile(title: "shot", fileExtension: "wav")
    case .knife:
      return AudioFile(title: "knife", fileExtension: "wav")
    case .gameOver:
      return AudioFile(title: "gameOver", fileExtension: "mp3")
    case .win:
      return AudioFile(title: "win", fileExtension: "mp3")
    case .onca:
      return AudioFile(title: "onca", fileExtension: "wav")
    case .calango:
      return AudioFile(title: "calango", fileExtension: "wav")
    case .cobra:
      return AudioFile(title: "cobra", fileExtension: "wav")
    case .soim:
      return AudioFile(title: "soim", fileExtension: "wav")
    case .carcara:
      return AudioFile(title: "carcara", fileExtension: "wav")
    case .corruptedFile:
      return AudioFile(title: "corruptedFile", fileExtension: "wav")
    case .nullURL:
      return AudioFile(title: "nullURL", fileExtension: "wav")
    }

  }
}
