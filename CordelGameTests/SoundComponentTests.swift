//
//  SoundComponentTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 29/03/21.
//

import XCTest
@testable import CordelGame

class SoundComponentTests: XCTestCase {
  var sut: SoundComponent!

  override func setUp() {
    super.setUp()
    self.sut = SoundComponent()

  }

  func test_configureSound_notPlaying() {
    sut.configureSound(soundStyle: .nullURL)
    
    XCTAssertNil(sut.sound, "Sound instanciado por conta da URL Nula")
  }

  func test_configureSound_isPlaying() {
    sut.configureSound(soundStyle: .background)

    XCTAssertNotNil(sut.sound, "Sound instanciado por conta de uma URL Válida")
    XCTAssertEqual(sut.sound.isPlaying, true)
  }

  func test_configureSound_invalidateFile() {
    sut.configureSound(soundStyle: .corruptedFile)

    XCTAssertNil(sut.sound, "Sound não é instanciado por conta que a URL não é do tipo de um áudio")
  }

  func test_configureSound_isBackgroundSound() {
    sut.configureSound(soundStyle: .background)

    XCTAssertEqual(sut.sound.numberOfLoops, -1)
  }

  func test_configureSound_isNotBackgroundSound() {
    sut.configureSound(soundStyle: .gameOver)

    XCTAssertEqual(sut.sound.numberOfLoops, 0)
  }

  override func tearDown() {
    sut = nil
  }
}
