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
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    var flipcount = 0 {
        didSet {                                                // Property observer - code to do something when the property changes values
            flipCountLabel.text = "Flips \(flipcount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card is not in cardButtons")
        }
    }
    


    func flipCard(withEmoji emoji: String, on button: UIButton) {
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    
}

