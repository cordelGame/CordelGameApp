//
//  AnimationCharacterComponentTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 18/03/21.
//

import XCTest
@testable import CordelGame

class AnimationCharacterComponentTests: XCTestCase {
  var sut: AnimationCharacterComponent!

  override func setUp() {
    super.setUp()
    let visualComponent: VisualComponent = VisualComponent(assetName: "cobra")

    sut = AnimationCharacterComponent(visualComponent: visualComponent)
  }

  func test_init_notNil() {
    XCTAssertNotNil(sut)
  }

  func test_animateCharacter_noThrowsWhenAttack() {
    XCTAssertNoThrow(sut.animateCharacter(typeAnimation: .attack))
  }

  func test_animateCharacter_noThrowsWhenDeath() {
    XCTAssertNoThrow(sut.animateCharacter(typeAnimation: .death))
  }

  override func tearDown() {
    sut = nil
  }
}
