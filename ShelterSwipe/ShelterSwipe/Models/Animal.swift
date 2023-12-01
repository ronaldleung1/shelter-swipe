//
//  Animal.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/19/23.
//

import Foundation

struct Animal: Hashable, Codable {
    let id: Int
    let name: String
    let species: String
    let breed: String
    let age: Int
    let gender: String
    let description: String?
    let photoUrl: String?
    let shelterId: Int
    let usersLiked: [User]?
    let usersDisliked: [User]?
}

//extension Animal {
//    static let dummyData = [
//        Animal(
//            id: "",
//            name: "Joe 🥏",
//            species: "sldkfjslkdf",
//            breed: "sldkslkdf",
//            age: 5
//            
//        ),
//        Animal(
//            id: "",
//            name: "cassidu",
//            species: "sldkfjslkdf",
//            breed: "sldkslkdf",
//            age: 7
//            
//        ),
//        Animal(
//            id: "",
//            name: "slkga",
//            species: "hihihi",
//            breed: "sldkslkdf",
//            age: 11
//            
//        ),
//        Animal(
//            id: "",
//            name: "goodjslfkw",
//            species: "lsljl",
//            breed: "jjjjjj",
//            age: 7
//            
//        )
//    ]
//}
