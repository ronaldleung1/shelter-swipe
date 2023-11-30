//
//  HomeView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/29/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var animals: [Animal] = []
    @State var animalIndex = 0
    
    var body: some View {
        mainView
    }
    
    private func fetchAnimals() {
        NetworkManager.shared.fetchAnimals{ animals in
            DispatchQueue.main.async {
                self.animals = animals
            }
        }
    }
    
    private var mainView: some View {
        ZStack {
            Color.purple2.edgesIgnoringSafeArea(.all)
            
            if animalIndex < animals.count {
//                CardView(animalIndex: $animalIndex)
                CardView(animalIndex: $animalIndex, animals: $animals)
            } else {
                Text("No more cards")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .preferredColorScheme(.light)
        .onAppear {
            fetchAnimals()
        }
    }
    
}

#Preview {
    HomeView()
}
