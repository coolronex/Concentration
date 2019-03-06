//
//  ViewController.swift
//  Concentration (Game)
//
//  Created by Aaron Chong on 3/4/19.
//  Copyright © 2019 Aaron Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    lazy var game = Concentration(numberofPairsOfCards: (cardButtons.count + 1) / 2)
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipcount = 0 {
        didSet {                                                // Property observer - code to do something when the property changes values
            flipCountLabel.text = "Flips \(flipcount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("chosen card is not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    
    var emojiChoices = ["🦇","🎃","🙀","🎃","👻","😈","🍭","🍬","🍎"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
//        ** top commented line is exactly the same as the bottom line **
        
        return emoji[card.identifier] ?? "?"
    }
    
}

