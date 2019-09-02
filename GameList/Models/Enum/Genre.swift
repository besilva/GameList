//
//  Genre.swift
//  GameList
//
//  Created by Bernardo Silva on 30/08/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import Foundation

enum Genre {
    case action
    case horror
    case racing
    
    func stringValue() -> String{
        switch self {
        case .action:
            return "Ação"
        case .horror:
            return "Terror"
        case .racing:
            return "Corrida"
        }
    }
}
