//
//  LandscapeEntityTests.swift
//  CordelGameTests
//
//  Created by José João Silva Nunes Alves on 16/03/21.
//

import XCTest
@testable import CordelGame

class LandscapeEntityTests: XCTestCase {

    func test_create_notNil() {
        let visualComponent = LandscapeEntity(assetName: "background")

        XCTAssertNotNil(visualComponent)
    }
}
