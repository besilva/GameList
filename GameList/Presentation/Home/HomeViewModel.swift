//
//  GameViewModel.swift
//  GameList
//
//  Created by Bernardo Silva on 30/08/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import Foundation
import UIKit
class HomeViewModel {
    
    private var games: Bind<[Game]>
    var gameCount: Bind<Int> = Bind(0)
    
    init(games: [Game]) {
        self.games = Bind(games)
        self.games.bind { (games) in
            self.gameCount.value = self.games.value.count
        }
    }
    
    init() {
        var initialGames: [Game] = []
        initialGames.append(Game(name: "God of War", genre: .action, hoursSpent: 10))
        initialGames.append(Game(name: "Resident Evil", genre: .action, hoursSpent: 5))
        initialGames.append(Game(name: "Need for Speed", genre: .racing, hoursSpent: 60))
        self.games = Bind(initialGames)
        self.games.bind { (games) in
            self.gameCount.value = self.games.value.count
        }
    }
    
    
    func getGameViewModel(cellForRowAt indexPath: IndexPath) -> GameViewModel {
        return GameViewModel(game: games.value[indexPath.row])
    }
    
    func deleteGame(index: Int){
        self.games.value.remove(at: index)
    }
}
