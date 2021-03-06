//
//  Concentration.swift
//  Concentration (Game)
//
//  Created by Aaron Chong on 3/5/19.
//  Copyright © 2019 Aaron Chong. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards of 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberofPairsOfCards: Int) {
        
        for _ in 1...numberofPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // Shuffle Cards
        for number in 0..<cards.count{
            let randomindex = Int(arc4random_uniform(UInt32(cards.count - number)))
            cards.append(cards.remove(at: randomindex))
        }
    }
    
}
