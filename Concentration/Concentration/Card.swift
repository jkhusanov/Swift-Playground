//
//  Card.swift
//  Concentration
//
//  Created by Jakhongir Khusanov on 2/23/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getaUniqueIdentifier()
        -> Int {
            identifierFactory += 1
            return identifierFactory
    }
    
    init() {
        self.identifier = Card.getaUniqueIdentifier()
    }
}
