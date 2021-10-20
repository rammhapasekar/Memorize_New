//
//  EmojiMemoryGame.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 19/10/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
  init(){
    theme = EmojiMemoryGame.themes.randomElement()!
    theme.emojis.shuffle()
    model = EmojiMemoryGame.createMemoryGame(of: theme)
  }
  
  static func createMemoryGame(of theme: Theme<String>) -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
      theme.emojis[pairIndex]
    }
  }
  
  static var themes: [Theme<String>] = [
    Theme(name: "Numbers",
          emojis: ["1","2","3","4","5","6","7","8","9","10"],
          numberOfPairsOfCards: 4,
          cardColor: "blue",
          id: 0),
    Theme(name: "Animals",
          emojis: ["🐅", "🐆", "🦓", "🦍", "🐘", "🦛", "🦏", "🐪", "🦒", "🦬", "🦘", "🐃", "🐄", "🐎", "🐖", "🐏", "🦙", "🐐", "🦌", "🐕", "🐇", "🦝", "🦨", "🦡", "🦫", "🦦", "🦥", "🐁", "🐀", "🐿", "🦔", "🐌"],
          numberOfPairsOfCards: 7,
          cardColor: "pink",
          id: 1),
    Theme(name: "Flags",
          emojis: ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇷", "🇦🇲", "🇦🇺", "🇦🇹", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇾", "🇧🇪", "🇧🇷", "🇧🇬", "🇨🇦", "🇨🇮", "🇭🇷", "🇩🇰", "🇪🇬", "🇫🇷", "🇩🇪", "🇬🇷", "🇯🇵", "🇮🇪", "🇯🇲", "🇮🇱", "🇰🇼", "🇵🇹", "🇱🇰", "🇪🇸", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇧", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇺🇾", "🇮🇳"],
          numberOfPairsOfCards: 10,
          cardColor: "orange",
          id: 2),
    Theme(name: "Vehicles",
          emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🛻", "🚚", "🚛", "🚜", "🚲", "🛵", "🏍", "🛺", "🚝", "✈️", "🚤","🚂", "🚀", "🚁"],
          numberOfPairsOfCards: 6,
          cardColor: "red",
          id: 3),
    Theme(name: "Plants",
          emojis: ["🌵","🎄","🌲","🌳","🌴","🪴","🎍","🎋","🌾"],
          numberOfPairsOfCards: 9,
          cardColor: "green",
          id: 4),
    Theme(name: "Cats",
          emojis: ["😺", "😸", "😹", "😻", "🙀", "😿", "😾", "😼"],
          numberOfPairsOfCards: 6,
          cardColor: "yellow",
          id: 5),
    Theme(name: "Shoes",
          emojis:["🥿","🩴","👠","👡","👢","👞","👟","🥾"],
          numberOfPairsOfCards: 20,
          cardColor: "gray",
          id: 6)
  ]
  
  
  @Published private var model: MemoryGame<String>
  
  private var theme: Theme<String>
  
  var cardColor: Color {
    switch theme.cardColor{
    case "red": return .red
    case "blue": return .blue
    case "pink": return .pink
    case "orange": return .orange
    case "green": return .green
    case "yellow": return .yellow
    case "gray": return .gray
    default: return .black
    }
  }
  
  var themeName: String {
    return theme.name
  }
  
  var score: Int{
    return model.score
  }
  
  var cards: Array<MemoryGame<String>.Card>{
    return model.cards
  }
  
  //MARK: - Intent(s)
  
  func choose(_ card: MemoryGame<String>.Card){
    model.choose(card)
  }
  
  func newGame(){
    theme = EmojiMemoryGame.themes.randomElement()!
    theme.emojis.shuffle()
    model = EmojiMemoryGame.createMemoryGame(of: theme)
  }
}
