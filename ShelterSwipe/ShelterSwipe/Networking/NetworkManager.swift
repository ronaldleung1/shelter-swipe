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
    private let endpoint: String = ""
    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase

    private init() { 
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchAnimals(completion: @escaping ([Animal]) -> Void) {
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Animal].self, decoder: decoder) { response in
                switch response.result {
                case .success(let animals):
                    print("Successfully fetched \(animals.count) animals")
                    completion(animals)
                case .failure(let error):
                    print("Error in NetworkManager.fetchAnimals: \(error.localizedDescription)")
                }
            }
    }
    
}