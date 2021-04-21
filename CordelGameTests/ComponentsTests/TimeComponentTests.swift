//
//  TimeComponentTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 21/04/21.
//

import XCTest
@testable import CordelGame
import SpriteKit

class TimeComponentTests: XCTestCase {
    var sut: TimeComponent!
    var node: SKSpriteNode!

    override func setUp() {
        super.setUp()
        node = SKSpriteNode(imageNamed: "blackBar")
        sut = TimeComponent(node: node)
    }

    func test_stop_untilWidth() {
        let testStop = sut.stop(width: 1.0)
        XCTAssertNoThrow(testStop)
    }

    func test_initWithCoder_returnNil() {
        sut = TimeComponent(coder: NSCoder())

        XCTAssertNil(sut)
    }

    override func tearDown() {
        sut = nil
    }
}
