//
//  AnimateCharacter.swift
//  CordelGame
//
//  Created by Cristiano Coutinho on 18/03/21.
//

import Foundation

enum AnimateCharacter {
  case attack
  case death

  var posFix: String {
    switch self {
    case .attack:
      return "+Attack"
    case .death:
      return "+Death"
    }
  }
}
