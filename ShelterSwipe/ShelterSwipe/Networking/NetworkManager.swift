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
    private let endpoint: String = "http://35.245.102.69/"
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchAnimals(completion: @escaping ([Animal]) -> Void) {
        AF.request(endpoint + "api/pets/", method: .get)
            .validate()
            .responseDecodable(of: AnimalResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success(let animalResponse):
                    let animals = animalResponse.pets
                    print("Successfully fetched \(animals.count) animals")
                    completion(animals)
                case .failure(let error):
                    print("Error in NetworkManager.fetchAnimals: \(error)")
                }
            }
    }
    
    func getUser(userId: Int, completion: @escaping (User) -> Void) {
        AF.request(endpoint + "api/users/\(userId)", method: .get)
            .responseDecodable(of: User.self, decoder: decoder) {  response in
                switch response.result  {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.getUser: \(error)")
                }
                
            }
    }
    
    func likePet(userId: Int, petId: Int, completion: @escaping (Bool) -> Void) {
        
        let parameters: Parameters = [
            "pet_id": petId,
        ]
        
        AF.request(endpoint + "api/users/\(userId)/liked-pets/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success :
                    print("Saved pet")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.likePet: \(error)")
                    completion(false)
                }
            }
        
    }
    
    
    
}
