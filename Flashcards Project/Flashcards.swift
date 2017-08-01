//
//  Flashcards.swift
//  Flashcards Project
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

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
        
        cards = [ Flashcard(question: "Test Question", options: ["True","False"]),
                  Flashcard(question: "What's the capitol of Washington state?", options:["Olympia", "Tacoma", "Seattle", "Spokane"]),
                  Flashcard(question: "Where is iD Tech's headquarters?", options:["Campbell, CA", "Albequerque, NM", "Beijing, CN"])]
        
        currentIndex = 0;
        
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
    
}
