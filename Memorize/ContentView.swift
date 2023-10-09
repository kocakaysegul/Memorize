//
//  ContentView.swift
//  Memorize
//
//  Created by Ayşegül Koçak on 6.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    //let emojies : Array<String> = ["🧕🏼", "💃🏻", "🤸🏻‍♀️", "🌸"]
    let emojis : [String] = ["🧕🏼", "💃🏻", "🤸🏻‍♀️", "🌸"]
    
    var body: some View {
       HStack {
           ForEach(emojis.indices, id: \.self) { index in
               CardView(content: emojis[index])
           }
     
        }
       .foregroundColor(.orange)
       .padding()
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
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
             
        }
        .onTapGesture {
            isFaceUp.toggle() //Its a struct
        }
    }
}
