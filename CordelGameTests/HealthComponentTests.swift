//
//  HealthComponentTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 17/03/21.
//

import XCTest
@testable import CordelGame

class HealthComponentTests: XCTestCase {
  var sut: HealthComponent!

  override func setUp() {
    super.setUp()

    sut = HealthComponent(maxHealth: 2)
  }

  func test_init_notNil() {
    XCTAssertNotNil(sut)
  }

  func test_isAlive_false() {
    let mock = HealthComponent(maxHealth: 0)
    let isAlive = mock.isAlive()
    XCTAssertFalse(isAlive)
  }

  func test_isAlive_true() {
    let isAlive = sut.isAlive()
    XCTAssertTrue(isAlive)
  }

  func test_hit_equalOne() {
    sut.hit()
    XCTAssertEqual(sut.health, 1)
  }

  override func tearDown() {
    sut = nil
  }
}
