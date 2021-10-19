//
//  Memorize_NewApp.swift
//  Memorize_New
//
//  Created by Ram Mhapasekar on 18/10/21.
//

import SwiftUI

@main
struct Memorize_NewApp: App {
  let game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
          ContentView(viewmodel: game)
        }
    }
}
