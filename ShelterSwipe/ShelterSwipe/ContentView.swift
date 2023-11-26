//
//  ContentView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Animal.dummyData
    @State var animalIndex = 0
    
    var body: some View {
        AuthView()
        
        if animalIndex < animals.count {
            CardView(animalIndex: $animalIndex)
        } else {
            Text("No more cards")
        }
        
        main
    }
    
}

