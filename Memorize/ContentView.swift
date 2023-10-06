//
//  ContentView.swift
//  Memorize
//
//  Created by Ayşegül Koçak on 6.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       HStack {
           CardView(isFaceUp: true)
           CardView(isFaceUp: true)
           CardView(isFaceUp: true)
           CardView(isFaceUp: true)
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
    
    @State var isFaceUp = false
    
    var body: some View{
        ZStack{
            
            //let base : RoundedRectangle =  RoundedRectangle(cornerRadius: 12)
            let base =  RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🧕🏼").font(.largeTitle)
            } else {
                base.fill()
            }
             
        }
        .onTapGesture {
            isFaceUp.toggle() //Its a struct
        }
    }
}
