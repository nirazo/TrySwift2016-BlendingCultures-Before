//
//  Hand.swift
//  BlendingCultures-Before
//
//  Created by Kenzo on 2016/03/05.
//  Copyright © 2016年 Karuta. All rights reserved.
//

import UIKit

class Hand {
    
    private var cards: [Card] = []
    
    var numberOfItems: Int {
        return cards.count
    }
    
    subscript(index: Int) -> Card {
        return cards[index]
    }
    
    func addNewItemAtIndex(index: Int) {
        return insertCard(Card.randomCard(), atIndex: index)
    }
    
    private func insertCard(card: Card, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }
    
    func cardAtPosition(index: Int) -> Card {
        return cards[index]
    }
    
    func deleteCardAtIndex(index: Int) {
        cards.removeAtIndex(index)
    }
    
    func moveCard(fromIndex: Int, toIndex: Int) {
        let cardToMove = cards[fromIndex]
        deleteCardAtIndex(fromIndex)
        insertCard(cardToMove, atIndex: toIndex)
    }

}