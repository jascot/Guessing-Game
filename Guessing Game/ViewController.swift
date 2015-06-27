//
//  ViewController.swift
//  Guessing Game
//
//  Created by Jason on 2/2/15.
//  Copyright (c) 2015 cis2640. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var cardPic: UIImageView!
    
    @IBOutlet weak var cSuit: UISegmentedControl!
    @IBOutlet weak var cValue: UISegmentedControl!

    var aSuit = 0
    var aValue = 0
    
    var cSuits = ["s","h","c","d"]
    var cVals = ["2","3","4","5","6","7","8","9","T","J","Q","K","A"]

    var cDeck = [UIImage(named: "Jo.jpg")!]
    
    @IBAction func submit(sender: AnyObject) {
        var result = ""
        
        if aSuit != cSuit.selectedSegmentIndex {
            result = "Wrong suit, and you're "
        }
        if aSuit == cSuit.selectedSegmentIndex {
            result = "Correct suit, but you're "
        }
        
        if aValue != cValue.selectedSegmentIndex {
            if cValue.selectedSegmentIndex + 4 < aValue {
                result += "way too low."
            } else if cValue.selectedSegmentIndex - 4 > aValue {
                result += "way too high."
            } else if cValue.selectedSegmentIndex < aValue {
                result += "a bit too low."
            } else {
                result += "a bit too high."
            }
        }

        if aValue == cValue.selectedSegmentIndex {
            if aSuit != cSuit.selectedSegmentIndex {
                result = "We're tied, with different suits."
            } else {
                result = "By Jove, you've got it!"
                cardPic.image = UIImage(named: cVals[aValue]+cSuits[aSuit]+".jpg")
            }
        }
        
        print(cValue.selectedSegmentIndex)
        print(cSuit.selectedSegmentIndex)
        
        resultText.text = result
    }
    
    @IBAction func NewGame(sender: AnyObject) {
        initState()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for s in cSuits {
            for v in cVals {
                cDeck.append(UIImage(named: v+s+".jpg")!)
            }
        }
        initState()
    }

    func initState() {
        aSuit = Int(arc4random_uniform(4))
        aValue = Int(arc4random_uniform(13))
        
        print(aSuit)
        print(aValue)
        
        resultText.text=""
        
        cardPic.image = UIImage(named: "Bk.jpg")
        
        cardPic.animationImages = cDeck;
        
        cardPic.animationRepeatCount=1
        cardPic.animationDuration = 1.5
        cardPic.startAnimating()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

