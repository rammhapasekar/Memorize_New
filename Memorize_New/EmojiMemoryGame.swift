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
          emojis: ["đ", "đ", "đĻ", "đĻ", "đ", "đĻ", "đĻ", "đĒ", "đĻ", "đĻŦ", "đĻ", "đ", "đ", "đ", "đ", "đ", "đĻ", "đ", "đĻ", "đ", "đ", "đĻ", "đĻ¨", "đĻĄ", "đĻĢ", "đĻĻ", "đĻĨ", "đ", "đ", "đŋ", "đĻ", "đ"],
          numberOfPairsOfCards: 7,
          cardColor: "pink",
          id: 1),
    Theme(name: "Flags",
          emojis: ["đĻđĢ", "đĻđŊ", "đĻđą", "đŠđŋ", "đĻđ¸", "đĻđŠ", "đĻđ´", "đĻđŽ", "đĻđˇ", "đĻđ˛", "đĻđē", "đĻđš", "đ§đ¸", "đ§đ­", "đ§đŠ", "đ§đž", "đ§đĒ", "đ§đˇ", "đ§đŦ", "đ¨đĻ", "đ¨đŽ", "đ­đˇ", "đŠđ°", "đĒđŦ", "đĢđˇ", "đŠđĒ", "đŦđˇ", "đ¯đĩ", "đŽđĒ", "đ¯đ˛", "đŽđą", "đ°đŧ", "đĩđš", "đąđ°", "đĒđ¸", "đ´ķ §ķ ĸķ Ĩķ Žķ §ķ ŋ", "đŦđ§", "đ´ķ §ķ ĸķ ˇķ Ŧķ ŗķ ŋ", "đēđž", "đŽđŗ"],
          numberOfPairsOfCards: 10,
          cardColor: "orange",
          id: 2),
    Theme(name: "Vehicles",
          emojis: ["đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đ", "đģ", "đ", "đ", "đ", "đ˛", "đĩ", "đ", "đē", "đ", "âī¸", "đ¤","đ", "đ", "đ"],
          numberOfPairsOfCards: 6,
          cardColor: "red",
          id: 3),
    Theme(name: "Plants",
          emojis: ["đĩ","đ","đ˛","đŗ","đ´","đĒ´","đ","đ","đž"],
          numberOfPairsOfCards: 9,
          cardColor: "green",
          id: 4),
    Theme(name: "Cats",
          emojis: ["đē", "đ¸", "đš", "đģ", "đ", "đŋ", "đž", "đŧ"],
          numberOfPairsOfCards: 6,
          cardColor: "yellow",
          id: 5),
    Theme(name: "Shoes",
          emojis:["đĨŋ","đŠ´","đ ","đĄ","đĸ","đ","đ","đĨž"],
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
