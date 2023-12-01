//
//  NetworkManager.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/28/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private let endpoint: String = "https://f20d-128-84-127-144.ngrok-free.app/"
    let decoder = JSONDecoder()
    
    private init() {
    }
    
    func fetchAnimals(completion: @escaping ([Animal]) -> Void) {
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(endpoint + "api/pets/", method: .get)
            .validate()
            .responseDecodable(of: AnimalResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let animalResponse):
                    let animals = animalResponse.pets
                    print("Successfully fetched \(animals.count) animals")
                    print(animals)
                    completion(animals)
                case .failure(let error):
                    print("Error in NetworkManager.fetchAnimals: \(error)")
                }
            }
    }
    
}
