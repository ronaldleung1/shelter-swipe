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
    let location: String
}
