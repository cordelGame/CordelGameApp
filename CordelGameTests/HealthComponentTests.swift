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

  func test_hit_equalOne() {
    sut.hit()
    XCTAssertEqual(sut.health, 1)
  }

  func test_health_notNegative() {
    sut.hit()
    sut.hit()
    sut.hit()
    XCTAssertEqual(sut.health, 0)
  }

  override func tearDown() {
    sut = nil
  }
}
