//
//  GameViewModel.swift
//  GameList
//
//  Created by Bernardo Silva on 02/09/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import Foundation

class GameViewModel {
    
    var game: Game
    var nameLabel: Bind<String>
    var genreLabel: Bind<String>
    var timeSpentLabel: Bind<String>
    
    init(game: Game) {
        self.game = game
        self.nameLabel = Bind(game.name)
        self.genreLabel = Bind(game.genre.stringValue())
        var message = ""
        if game.hoursSpent > 24 {
            message = "Você ja jogou por \(game.hoursSpent/24) dias"
        } else {
            message = "Você ja jogou por \(game.hoursSpent) horas"
        }
        self.timeSpentLabel = Bind(message)
    }
}
