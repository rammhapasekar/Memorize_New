//
//  Theme.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 20/10/21.
//

import Foundation

struct Theme<Content>: Identifiable{
  var id: Int  
  var name: String
  var emojis: Array<Content>
  var numberOfPairsOfCards: Int
  var cardColor: String
  
  init(name: String, emojis: Array<Content>, numberOfPairsOfCards: Int, cardColor: String, id: Int){
    self.name = name
    self.emojis = emojis
    self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
    self.cardColor = cardColor
    self.id = id
  }
}
