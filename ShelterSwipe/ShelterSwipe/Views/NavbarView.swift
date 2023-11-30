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
            SavedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Saved")
                }
        }
    }
}

#Preview {
    NavbarView()
}
