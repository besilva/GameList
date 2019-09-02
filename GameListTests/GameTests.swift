//
//  GameTests.swift
//  GameListTests
//
//  Created by Bernardo Silva on 02/09/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import XCTest
@testable import GameList
class GameTests: XCTestCase {

    let game = Game(name: "Teste", genre: .horror, hoursSpent: 5)
    
    func testGenre() {
        XCTAssertEqual(game.genre.stringValue(), Genre.horror.stringValue())
    }

}
