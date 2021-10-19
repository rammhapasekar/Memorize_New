//
//  MemoryGame.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 19/10/21.
//

import Foundation

struct MemoryGame<CardContent> {
  private(set) var cards: Array<Card>
  
  func choose(_ card: Card){
    
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
    cards = Array<Card>()
    //add numberOfPairsOfCard * 2 cards to cards array
    for pairIndex in 0..<numberOfPairsOfCards {
      let content: CardContent = createCardContent(pairIndex)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  struct Card {
    var isFacedUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
  }
}
