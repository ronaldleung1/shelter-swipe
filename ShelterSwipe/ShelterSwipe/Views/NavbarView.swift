//
//  TabView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/29/23.
//

import SwiftUI

struct NavbarView: View {
    
    var body: some View {
        bar
    }
    
    private var bar: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
//                .toolbar(.visible, for: .tabBar)
//                .toolbarBackground(.white, for: .tabBar)
            SavedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Saved")
                }
            
            SignOutView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
    
        }
        .tint(.black)
        
    }
}

//#Preview {
//    NavbarView()
//}
