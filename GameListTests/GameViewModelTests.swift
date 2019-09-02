//
//  GameViewModel.swift
//  GameListTests
//
//  Created by Bernardo Silva on 02/09/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import XCTest
@testable import GameList
class GameViewModelTests: XCTestCase {
    
    let game = Game(name: "Call of Duty", genre: .action, hoursSpent: 100)
    
    func testHoursSpent() {
        let gameViewModel = GameViewModel(game: self.game)
        if game.hoursSpent > 24 {
            XCTAssertEqual(gameViewModel.timeSpentLabel.value, "Você ja jogou por \(game.hoursSpent/24) dias")
        } else {
            XCTAssertEqual(gameViewModel.timeSpentLabel.value, "Você ja jogou por \(game.hoursSpent) horas")
        }

    }
}
