//
//  GameListTests.swift
//  GameListTests
//
//  Created by Bernardo Silva on 30/08/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import XCTest
@testable import GameList

class HomeViewModelTests: XCTestCase {
    var homeViewModel: HomeViewModel = HomeViewModel()
    var initialGames: [Game] = [Game(name: "God of War", genre: .action, hoursSpent: 10),
                                Game(name: "Resident Evil", genre: .action, hoursSpent: 5),
                                Game(name: "Need for Speed", genre: .racing, hoursSpent: 60)]

    override func setUp() {
        homeViewModel = HomeViewModel(games: initialGames)
    }
    
    func testCount() {
        XCTAssertEqual(homeViewModel.gameCount.value, 3)
    }
    
    func testDelete() {
        var indexPath = IndexPath(item: 0, section: 0)
        var gameViewModel = homeViewModel.getGameViewModel(cellForRowAt: indexPath)
        self.checkGameInfo(gameViewModel: gameViewModel, expectedGame: initialGames.first!)
        let oldCount = homeViewModel.gameCount.value
        homeViewModel.deleteGame(index: 0)
        indexPath = IndexPath(item: 0, section: 0)
        gameViewModel = homeViewModel.getGameViewModel(cellForRowAt: indexPath)
        self.checkGameInfo(gameViewModel: gameViewModel, expectedGame: initialGames[1])
        XCTAssertFalse(oldCount == homeViewModel.gameCount.value)
    }
    
    func testFirst() {
        let indexPath = IndexPath(item: 0, section: 0)
        let gameViewModel = homeViewModel.getGameViewModel(cellForRowAt: indexPath)
        checkGameInfo(gameViewModel: gameViewModel, expectedGame: initialGames.first!)
    }
    
    func testSecond(){
        let indexPath = IndexPath(item: 1, section: 0)
        let gameViewModel = homeViewModel.getGameViewModel(cellForRowAt: indexPath)
        checkGameInfo(gameViewModel: gameViewModel, expectedGame: initialGames[1])
    }
    
    func testThird() {
        let indexPath = IndexPath(item: 2, section: 0)
        let gameViewModel = homeViewModel.getGameViewModel(cellForRowAt: indexPath)
        checkGameInfo(gameViewModel: gameViewModel, expectedGame: initialGames[2])
    }
    
    func checkGameInfo(gameViewModel: GameViewModel, expectedGame: Game) {
        XCTAssertEqual(gameViewModel.nameLabel.value, expectedGame.name)
        XCTAssertEqual(gameViewModel.genreLabel.value, expectedGame.genre.stringValue())
    }
}
