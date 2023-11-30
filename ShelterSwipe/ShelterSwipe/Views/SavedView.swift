//
//  SavedView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct SavedView: View {
    
//    private let animals: [Animal] = Animal.dummyData
    @State private var animals: [Animal] = []
    
    var body: some View {
        
        scrollContent
            //.preferredColorScheme(.light)
            //.background(Color.black)
    }
    
    private func fetchAnimals() {
        NetworkManager.shared.fetchAnimals{ animals in
            DispatchQueue.main.async {
                self.animals = animals
            }
        }
    }
    
    private var scrollContent: some View {
        NavigationView {
            List (animals, id: \.self) { animal in                    ScrollView{
                        Spacer()
                        animalCell(animal)
                    }
                    .listRowBackground(Color.purple2)
            }
            .onAppear {
                fetchAnimals()
            }
            .navigationTitle("Saved")
            .background(Color.purple2)
            .scrollContentBackground(.hidden)

        }

        
//        VStack(spacing: 20) {
//            ForEach(animals, id: \.self) { animal in
//                animalCell(animal)
//            }
//
//        }
//        .padding(.horizontal, 24)
    }
    
    private func animalCell(_ animal: Animal) -> some View {
        HStack {
            animalImage(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*"))
//            animalImage(url: URL(string: animal.photo_url ?? ""))
            
            VStack(alignment: .leading) {
                Text("Name: \(animal.name)")
                Text("Species: \(animal.species)")
                Text("Breed: \(animal.breed)")
            }
            .foregroundColor(.white)
            .fontWeight(.medium)
            
            Spacer()
        }
        .background(Color.purple1)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    private func animalImage(url: URL?) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .leading)
                    .cornerRadius(10)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(alignment: .leading)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.purple2, lineWidth: 5)
        )
        .padding(10)
    }
    
}
