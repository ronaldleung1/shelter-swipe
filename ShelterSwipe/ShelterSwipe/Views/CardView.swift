//
//  CardView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/23/23.
//

import SwiftUI

struct CardView: View {
    
    @State private var offset = CGSize.zero
    @State private var color = Color.clear
    @Binding var animalIndex: Int
    @Binding var animals: [Animal]
    @EnvironmentObject var user: User
//    private let animals = Animal.dummyData
    
    var body: some View {
        if animalIndex < animals.count && animalIndex >= 0 {
            let animal = animals[animalIndex]
            
            VStack{
                animalCard(animal)
                Spacer()
                animalDescription(animal)
                Spacer()
            }
            .fontWeight(.medium)
            // iOS 17
            //            .onChange(of: animalIndex) {
            //                // Reset offset and color when animalIndex changes
            //                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //                    offset = .zero
            //                    color = .clear
            //                }
            //            }
            
            //            // iOS 16
            .onChange(of: animalIndex) { newValue in
                // Reset offset and color when animalIndex changes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    offset = .zero
                    color = .clear
                }
            }
            
        } else {
            Text("No more cards")
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }

        
    }
    
    private func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            //            print("disliked")
            offset = CGSize(width: -500, height: 0)
            animalIndex += 1
        case 150...500:
            //            print("liked")
            savePet(animals[animalIndex])
            offset = CGSize(width: 500, height: 0)
            animalIndex += 1
        default:
            offset = .zero
        }
    }
    
    private func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .clear
        }
    }
    
    private func animalCard(_ animal: Animal) -> some View {
        VStack{
            animalImage(animal)
            Text(animal.name)
                .font(.title)
                .padding(.bottom, 20)
                .foregroundColor(.white)
        }
        .overlay(color.opacity(0.5))
        .background(Color.purple1)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple1, lineWidth: 5)
        )
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width/40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                } .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
        .padding(.top, 30)
    }
    
    private func animalImage(_ animal: Animal) -> some View {
        let imageUrl = URL(string: animal.photoUrl ?? "")
        return AsyncImage(
            url: imageUrl,
            content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300, alignment: .center)
                    .cornerRadius(20)
                    .overlay(color.opacity(0.5))
            },
            placeholder: {
                ProgressView()
            }
        )
        .padding(10)
    }
    
    private func animalDescription(_ animal: Animal) -> some View {
        VStack(alignment: .leading) {
            
            VStack{
                Group{
                    Text("Name: \(animal.name)")
                    Text("Species: \(animal.species)")
                    Text("Breed: \(animal.breed)")
                    Text("Age: \(String(animal.age)) years old")
                    Text("Gender: \(animal.gender)")
                    if let description = animal.description {
                        Text("Description: \(description)")
                    }
                }.foregroundColor(.white)
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(Color.purple1)
            .cornerRadius(20)
            .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple1, lineWidth: 5)
            )
        }
    }
    
    private func savePet (_ animal: Animal) {
        NetworkManager.shared.likePet(userId: user.id, petId: animal.id) { success in
            if success {
                print("works. saved pet")
            }
        }

    }
    
}

//#Preview {
//    CardView(animalIndex: Binding.constant(0), animals: <#Binding<[Animal]>#>)
//}
