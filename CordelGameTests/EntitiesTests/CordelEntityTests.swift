//
//  CordelEntityTests.swift
//  CordelGameTests
//
//  Created by Cristiano Coutinho on 21/04/21.
//

import XCTest
@testable import CordelGame

class CordelEntityTests: XCTestCase {
    var sut: CordelEntity!
    var game: GameManager!

    override func setUp() {
        super.setUp()

        game = GameManager(enemyLevel: EnemiesLevel1.onca)
        var enemy = game.getEnemy()
        let cordel = enemy.cordeis.getCordel()
        sut = CordelEntity(assetName: cordel.name)
    }

    func test_init_notNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_initWithCoder_returnNil() {
      sut = CordelEntity(coder: NSCoder())

      XCTAssertNil(sut)
    }

    override func tearDown() {
        sut = nil
    }
}
