//
//  Animal.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/19/23.
//

import Foundation

class Animal: Hashable, Decodable, ObservableObject {
    
    @Published var id: Int
    @Published var name: String
    @Published var species: String
    @Published var breed: String
    @Published var age: Int
    @Published var gender: String
    @Published var description: String?
    @Published var photoUrl: String?
    @Published var shelterId: Int
    @Published var usersLiked: [User]?
    @Published var usersDisliked: [User]?
    
    init(id: Int, name: String, species: String, breed: String, age: Int, gender: String, description: String?, photoUrl: String?, shelterId: Int, usersLiked: [User]?, usersDisliked: [User]?) {
        self.id = id
        self.name = name
        self.species = species
        self.breed = breed
        self.age = age
        self.gender = gender
        self.description = description
        self.photoUrl = photoUrl
        self.shelterId = shelterId
        self.usersLiked = usersLiked
        self.usersDisliked = usersDisliked
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum CodingKeys: CodingKey {
        case id, name, species, breed, age, gender, description, photoUrl, shelterId, usersLiked, usersDisliked
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        species = try container.decode(String.self, forKey: .species)
        breed = try container.decode(String.self, forKey: .breed)
        age = try container.decode(Int.self, forKey: .age)
        gender = try container.decode(String.self, forKey: .gender)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        shelterId = try container.decode(Int.self, forKey: .shelterId)
        usersLiked = try container.decodeIfPresent([User].self, forKey: .usersLiked)
        usersDisliked = try container.decodeIfPresent([User].self, forKey: .usersDisliked)
    }
    
}
