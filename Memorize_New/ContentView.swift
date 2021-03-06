//
//  ContentView.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 18/10/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewmodel: EmojiMemoryGame
  
  var body: some View {
    VStack{
      HStack{
        Text(viewmodel.themeName)
          .font(.largeTitle)
        Spacer()
        Text("\(viewmodel.score)")
          .font(.largeTitle)
      }
      .padding()
      ScrollView{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
          ForEach(viewmodel.cards){ card in
            CardView(card: card )
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                viewmodel.choose(card)
              }
          }
        }
      }
      .foregroundColor(viewmodel.cardColor)
      .padding(.horizontal)
      
      Button {
        viewmodel.newGame()
      } label: {
        Text("New Game").font(.largeTitle)
      }
    }
  }
}

struct CardView: View{
  let card: MemoryGame<String>.Card
  
  var body: some View{
    ZStack(alignment: .center){
      let shape = RoundedRectangle(cornerRadius: 20.0)
      if card.isFaceUp{
        shape
          .fill()
          .foregroundColor(.white)
        shape
          .strokeBorder(lineWidth: 3)
        Text(card.content)
          .font(.largeTitle)
      }
      else if card.isMatched{
        shape.opacity(0.5)
      }
      else{
        shape
          .fill()
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewmodel: game)
      .preferredColorScheme(.light)
    ContentView(viewmodel: game)
      .preferredColorScheme(.dark)
  }
}
