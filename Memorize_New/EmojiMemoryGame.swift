//
//  EmojiMemoryGame.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 19/10/21.
//

import SwiftUI

//func makeCardContent(index: Int) -> String{
//  return "✈️"
//}

class EmojiMemoryGame {
  
  static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🛻", "🚚", "🚛", "🚜", "🚲", "🛵", "🏍", "🛺", "🚝", "✈️", "🚤","🚂", "🚀", "🚁"]
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  private var model: MemoryGame<String> =  createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card>{
    return model.cards
  }
}
