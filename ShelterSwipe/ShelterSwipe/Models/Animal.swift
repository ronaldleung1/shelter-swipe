//
//  Animal.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/19/23.
//

import Foundation

struct Animal: Hashable, Codable {
    let id: String
    let name: String
    let species: String
    let breed: String
    let age: Int
}

extension Animal {
    static let dummyData = [
        Animal(
            id: "",
            name: "sldkfjdsl",
            species: "sldkfjslkdf",
            breed: "sldkslkdf",
            age: 5
            
        ),
        Animal(
            id: "",
            name: "cassidu",
            species: "sldkfjslkdf",
            breed: "sldkslkdf",
            age: 7
            
        )
    ]
}
