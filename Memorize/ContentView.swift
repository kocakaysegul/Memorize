//
//  ContentView.swift
//  Memorize
//
//  Created by Ayşegül Koçak on 6.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    //let emojies : Array<String> = ["🧕🏼", "💃🏻", "🤸🏻‍♀️", "🌸"]
    let emojis : [String] = ["🧕🏼", "💃🏻", "🤸🏻‍♀️", "🌸", "🌸", "🧕🏼", "💃🏻", "🤸🏻‍♀️", "🌸", "🌸"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
    
    var cards: some View {
        //LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    let content : String
    @State var isFaceUp = true
    
    var body: some View{
        ZStack{
            
            //let base : RoundedRectangle =  RoundedRectangle(cornerRadius: 12)
            let base =  RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
             
        }
        .onTapGesture {
            isFaceUp.toggle() //Its a struct
        }
    }
}
