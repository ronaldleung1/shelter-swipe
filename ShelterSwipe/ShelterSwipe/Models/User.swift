//
//  User.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/30/23.
//

import Foundation

struct User: Hashable, Codable {
    let id: Int
    let name: String
    let email: String
    let location: String
    let likedPets: [Animal]?
    let dislikedPets: [Animal]?
}
