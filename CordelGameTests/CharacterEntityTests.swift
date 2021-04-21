//
//  CharacterEntityTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 19/03/21.
//

import XCTest
@testable import CordelGame

class CharacterEntityTests: XCTestCase {

  func test_init_notNil() {
    let sut: CharacterEntity = CharacterEntity(assetName: "Cobra", health: 2, sound: .cobra)

    XCTAssertNotNil(sut)
  }

}
