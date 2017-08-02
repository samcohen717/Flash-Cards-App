//
//  Flashcards.swift
//  Flashcards Project
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
    }
}
// Expand to see the rest of the shuffle lines.

class CardCollection {
    
    // Single instance of the card collection
    public static var instance : CardCollection = CardCollection()
    
    // The list of flashcards
    public private(set) var cards : [Flashcard]
    
    // Which question are we on?
    public private(set) var currentIndex : Int
    
    // Get the current card.
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init(){
        
        cards = [ Flashcard(question: "Sam plays basketball.", options: ["False","True"]),
                  Flashcard(question: "Which does Sam not play?", options:["Guitar ", "Violin", "Piano", "Tennis"]),
                  Flashcard(question: "Where does Sam live", options:["East Rockaway, NY", "Los Angeles, CA", "Newport, RI"])]
        
        currentIndex = 0;
        
        cards = shuffle(list: cards)
        
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
            cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
    
}

func shuffle<T>( list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
