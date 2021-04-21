//
//  TimeBarEntityTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 21/04/21.
//

import XCTest
@testable import CordelGame

class TimeBarEntityTests: XCTestCase {
    var sut: TimeBarEntity!

    override func setUp() {
        super.setUp()

        sut = TimeBarEntity("blackBar")
    }

    func test_initWithCoder_returnNil() {
        sut = TimeBarEntity(coder: NSCoder())

        XCTAssertNil(sut)
    }

    override func tearDown() {
        sut = nil
    }
}
