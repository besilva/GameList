//
//  Bind.swift
//  GameList
//
//  Created by Bernardo Silva on 01/09/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import Foundation

class Bind<T> {
    typealias  Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}
