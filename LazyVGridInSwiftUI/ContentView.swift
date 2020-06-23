//
//  ContentView.swift
//  LazyVGridInSwiftUI
//
//  Created by Ramill Ibragimov on 23.06.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: CGFloat = 2
    
    let animals = ["🦅", "🦑", "🦏", "🦜", "🐓", "🐈", "🐕‍🦺", "🦒", "🐫", "🦓", "🦧", "🐘", "🦍", "🐆"]
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int(self.sliderValue))
        
        return VStack {
            
            Slider(value: $sliderValue, in: 2...4, step: 1)
                .padding()
            Text(String(format: "%.0f", self.sliderValue))
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(self.animals, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: 100))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
