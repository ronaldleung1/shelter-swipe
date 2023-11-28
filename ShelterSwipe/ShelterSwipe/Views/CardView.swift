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
    private let animals = Animal.dummyData
    
    var body: some View {
        if animalIndex < animals.count && animalIndex >= 0 {
            let animal = animals[animalIndex]
            
            VStack{
                animalCard(animal)
                Spacer()
                animalDescription(animal)
                Spacer()
            }
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
            animalImage
            Text(animal.name)
                .font(.title)
                .padding(.bottom, 20)
        }
        .background(.white)
        .border(.white, width: 5)
        .cornerRadius(20)
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
        .padding(.top, 100)
    }
    
    private var animalImage: some View {
        AsyncImage(
            url: URL(string: "https://www.thesprucepets.com/thmb/hxWjs7evF2hP1Fb1c1HAvRi_Rw0=/2765x0/filters:no_upscale():strip_icc()/chinese-dog-breeds-4797219-hero-2a1e9c5ed2c54d00aef75b05c5db399c.jpg"),
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
            Text("Name: \(animal.name)")
            Text("Species: \(animal.species)")
            Text("Breed: \(animal.breed)")
        }
    }
    
}

#Preview {
    CardView(animalIndex: Binding.constant(0))
}
