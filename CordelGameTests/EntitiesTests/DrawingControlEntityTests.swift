//
//  DrawingControlEntityTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 21/04/21.
//

import XCTest
@testable import CordelGame

class DrawingControlEntityTests: XCTestCase {
    var sut: DrawingControlEntity!

    override func setUp() {
        super.setUp()

        sut = DrawingControlEntity()
    }

    func test_create_notNil() {
        XCTAssertNotNil(sut)
    }

    func test_initWithCoder_returnNil() {
      sut = DrawingControlEntity(coder: NSCoder())

      XCTAssertNil(sut)
    }

    override func tearDown() {
        sut = nil
    }
}
