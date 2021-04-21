//
//  CharacterEntityTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 19/03/21.
//

import XCTest
@testable import CordelGame

class CharacterEntityTests: XCTestCase {
  var sut: CharacterEntity!

  override func setUp() {
    super.setUp()

    sut = CharacterEntity(assetName: "Cobra", health: 2)
  }

  func test_init_notNil() {
    XCTAssertNotNil(sut)
  }

  func test_deathCharacter_callDeath() {
    XCTAssertNoThrow(sut.deathCharacter())
  }

  func test_initWithCoder_returnNil() {
    sut = CharacterEntity(coder: NSCoder())

      XCTAssertNil(sut)
  }
  override func tearDown() {
    sut = nil
  }
}
