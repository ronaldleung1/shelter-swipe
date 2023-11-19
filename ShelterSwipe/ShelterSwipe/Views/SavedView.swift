//
//  SavedView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct SavedView: View {
    
    private let animals: [Animal] = Animal.dummyData

    var body: some View {
        ScrollView {
            scrollContent
        }
    }
    
    private var scrollContent: some View {
        VStack(spacing: 20) {
            ForEach(animals, id: \.self) { animal in
                animalCell(animal)
            }
            //                ForEach(0..<10) {
            //                    Text("Item \($0)")
            //                        .foregroundStyle(.white)
            //                        .font(.largeTitle)
            //                        .frame(width: 200, height: 200)
            //                        .background(.red)
            //                }
        }
        .padding(.horizontal, 24)
    }
    
    private func animalCell(_ animal: Animal) -> some View {
        HStack {
            animalImage(url: URL(string: "https://www.hartz.com/wp-content/uploads/2022/04/small-dog-owners-1.jpg"))
            
            VStack(alignment: .leading) {
                Text("Name: \(animal.name)")
                Text("Species: \(animal.species)")
                Text("Breed: \(animal.breed)")
            }
            
            Spacer()
        }
    }
    
    private func animalImage(url: URL?) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .leading)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(alignment: .leading)
    }
    
//    var func cell (pet) some View {
//        Text("Item \($0)")
//            .foregroundStyle(.white)
//            .font(.largeTitle)
//            .frame(width: 200, height: 200)
//            .background(.red)
//    }
}

#Preview {
    SavedView()
}
