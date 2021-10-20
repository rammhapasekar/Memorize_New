//
//  MemoryGame.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 19/10/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
  private(set) var cards: Array<Card>
  
  private(set) var score: Int = 0
  private var indexOfTheOneAndOnlyFaceUpCard: Int?
  
  mutating func choose(_ card: Card){
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
       !cards[chosenIndex].isFaceUp,
       !cards[chosenIndex].isMatched {
      if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard{
        if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
          cards[chosenIndex].isMatched = true
          cards[potentialMatchedIndex].isMatched = true
          score += 2
        }
        else{
          if cards[chosenIndex].hasAlreadySeenCard || cards[potentialMatchedIndex].hasAlreadySeenCard {
            score -= 1
          }
        }
        indexOfTheOneAndOnlyFaceUpCard = nil
      }
      else{
        for index in cards.indices{
          if cards[index].isFaceUp{
            cards[index].isFaceUp = false
            cards[index].hasAlreadySeenCard = true
            
          }
          
        }
        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
      }
      cards[chosenIndex].isFaceUp.toggle()
    }
    print("\(cards)")
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
    cards = Array<Card>()
    //add numberOfPairsOfCard * 2 cards to cards array
    for pairIndex in 0..<numberOfPairsOfCards {
      let content: CardContent = createCardContent(pairIndex)
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
    }
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var hasAlreadySeenCard = false
    var content: CardContent
    var id: Int
  }
}
