//
//  ContentView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    
        let animals: [Animal] = Animal.dummyData
//    @State private var animals: [Animal] = []
    @State var animalIndex = 0
    
    var body: some View {
        //        AuthView()
        
//        if animalIndex < animals.count {
//            CardView(animalIndex: $animalIndex)
////                .onAppear {
////                    fetchAnimals()
////                }
//        } else {
//            Text("No more cards")
//        }
        
        SavedView()
        
    }
    
//    private func fetchAnimals() {
//        NetworkManager.shared.fetchAnimals{ animals in
//            DispatchQueue.main.async {
//                self.animals = animals
//            }
//        }
//    }
    
}

#Preview {
    ContentView()
}
