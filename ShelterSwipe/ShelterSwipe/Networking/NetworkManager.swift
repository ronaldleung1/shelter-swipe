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
    
   // func fetchLikedAnimals(completion: @escaping ([Animal]) -> Void) {
   //
   //        AF.request(endpoint + "api/users/3/liked-pets/", method: .get)
   //            .responseDecodable(of: AnimalResponse.self, decoder: decoder) { response in
   //                switch response.result {
   //                case .success(let animalResponse):
   //                    let likedAnimals = animalResponse.pets
   //                    print("Successfully fetched \(likedAnimals.count) animals")
   //                    completion(likedAnimals)
   //                case .failure(let error):
   //                    print("Error in NetworkManager.fetchAnimals: \(error)")
   //                }
   //            }
   //    }
       
       func getUser(completion: @escaping (User) -> Void) {
           AF.request(endpoint + "api/users/2", method: .get)
               .responseDecodable(of: User.self, decoder: decoder) {  response in
                   switch response.result  {
                   case .success(let user):
                       completion(user)
                   case .failure(let error):
                       print("Error in NetworkManager.getUser: \(error)")
                   }
     
               }
       }
       
//    func createUser(name: String, email: String, completion: @escaping (Bool) -> Void){
//        let parameters: Parameters = ["name" : name, "email" : email] // idk if this is how to create a user with 2 parameters
//
//        AF.request(endpoint + "api/users/", method: .post, parameters: parameters)
//            .responseDecodable(of: User.self, decoder: decoder) { response in
//                switch response.result {
//                case .success :
//                    print("Added a new user")
//                    completion(true)
//                case .failure(let error):
//                    print("Error in NetworkManager.createUser: \(error)")
//                    completion(false)
//                }
//            }
//    }
}
