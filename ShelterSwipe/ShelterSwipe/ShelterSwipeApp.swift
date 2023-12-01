//
//  ShelterSwipeApp.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

@main
struct ShelterSwipeApp: App {
    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    @StateObject var user = User(id: 0, name: "", email: "", likedPets: nil, dislikedPets: nil)
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
                .environmentObject(user)
                .onAppear {
                    NetworkManager.shared.getUser { fetchedUser in
                        DispatchQueue.main.async {
                            user.id = fetchedUser.id
                            user.name = fetchedUser.name
                            user.email = fetchedUser.email
                            user.likedPets = fetchedUser.likedPets
                            user.dislikedPets = fetchedUser.dislikedPets
                        }
                    }

                }
        }
    }
}
