//
//  DrawComponentTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 21/04/21.
//

import XCTest
@testable import CordelGame

class DrawComponentTests: XCTestCase {
    var sut: DrawComponent!
    var visualComponent: VisualComponent!

    override func setUp() {
        super.setUp()

        visualComponent = VisualComponent(assetName: "control")
        sut = DrawComponent(visualComponent: visualComponent)
    }

    func test_init_notNil() {
        XCTAssertNotNil(sut)
    }

    func test_initWithCoder_returnNil() {
      sut = DrawComponent(coder: NSCoder())

      XCTAssertNil(sut)
    }

    override func tearDown() {
        sut = nil
    }
}
