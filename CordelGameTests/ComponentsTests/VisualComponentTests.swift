//
//  VisualComponentTests.swift
//  CordelGameTests
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import XCTest
import SpriteKit
@testable import CordelGame

class VisualComponentTests: XCTestCase {
    var sut: VisualComponent!

    override func setUp() {
      super.setUp()
        
      sut = VisualComponent(assetName: "cobra")
    }

    func test_init_notNil() {
        XCTAssertNotNil(sut)
    }

    func test_changeAsset_notEqual() {
      let sprite: SKSpriteNode = sut.node
      sut.changeAsset(assetName: "personagem")
      XCTAssertNotEqual(sprite, sut.node)
    }

    func test_initWithCoder_returnNil() {
      sut = VisualComponent(coder: NSCoder())

      XCTAssertNil(sut)
    }

    override func tearDown() {
      sut = nil
    }
}
