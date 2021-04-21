//
//  LandscapeEntityTests.swift
//  CordelGameTests
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import XCTest
@testable import CordelGame

class LandscapeEntityTests: XCTestCase {
    var sut: LandscapeEntity!

    override func setUp() {
      super.setUp()

      sut = LandscapeEntity(assetName: "background")
    }

    func test_init_notNil() {
        XCTAssertNotNil(sut)
    }

    func test_initWithCoder_returnNil() {
      sut = LandscapeEntity(coder: NSCoder())

        XCTAssertNil(sut)
    }

    override func tearDown() {
      sut = nil
    }
}
