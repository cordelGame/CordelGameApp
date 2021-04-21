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

    XCTAssertNil(sut.sound, "Sound foi<##> instanciado mesmo com a URL Nula")
  }

  func test_configureSound_invalidateFile() {
    sut.configureSound(soundStyle: .corruptedFile)

    XCTAssertNil(sut.sound, "Sound foi instanciado mesmo com a URL não sendo do tipo de um áudio")
  }

  func test_configureSound_isBackgroundSound() {
    sut.configureSound(soundStyle: .background)

    XCTAssertEqual(sut.sound.numberOfLoops, -1)
  }

  func test_configureSound_isNotBackgroundSound() {
    sut.configureSound(soundStyle: .gameOver)

    XCTAssertEqual(sut.sound.numberOfLoops, 0)
  }

  func test_playSound_isPlaying() {
    sut.configureSound(soundStyle: .background)
    sut.playSound()

    XCTAssertNotNil(sut.sound, "Sound não instanciado mesmo com uma URL Válida")
    XCTAssertEqual(sut.sound.isPlaying, true)
  }

  func test_pauseSound_isNotPlaying() {
    sut.configureSound(soundStyle: .background)
    sut.pauseSound()

    XCTAssertNotNil(sut.sound, "Sound não instanciado mesmo com uma URL Válida")
    XCTAssertEqual(sut.sound.isPlaying, false)
  }

  func test_temporaryVolume_isChanged() {
    sut.configureSound(soundStyle: .background)
    sut.pauseSound()
    sut.temporaryVolume(volume: 0.25, duration: 2.0)

    XCTAssertEqual(sut.sound.volume, 0.25)

  }

  func test_temporaryVolume_returnToDefault() {
    let exp = expectation(description: "\(#function)")

    sut.configureSound(soundStyle: .background)
    sut.pauseSound()
    sut.temporaryVolume(volume: 0.25, duration: 2.0)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.1) {
        if self.sut.sound.volume == 1 { // XCTAssertEqual(sut.sound.volume, 1.0)
            exp.fulfill()
        }
    }

    waitForExpectations(timeout: 2.1)
  }

  override func tearDown() {
    sut = nil
  }
}
