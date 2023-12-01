//
//  User.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/30/23.
//

import Foundation

class User: Hashable, Decodable, ObservableObject {
    
    @Published var id: Int
    @Published var name: String
    @Published var email: String
    @Published var location: String
    @Published var likedPets: [Animal]?
    @Published var dislikedPets: [Animal]?
    
    init(id: Int, name: String, email: String, location: String, likedPets: [Animal]?, dislikedPets: [Animal]?) {
        self.id = id
        self.name = name
        self.email = email
        self.location = location
        self.likedPets = likedPets
        self.dislikedPets = dislikedPets
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum CodingKeys: CodingKey {
        case id, name, email, location, likedPets, dislikedPets
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        location = try container.decode(String.self, forKey: .location)
        likedPets = try container.decodeIfPresent([Animal].self, forKey: .likedPets)
        dislikedPets = try container.decodeIfPresent([Animal].self, forKey: .dislikedPets)
    }
    
}
