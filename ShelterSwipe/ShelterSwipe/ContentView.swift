//
//  ContentView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserAuthModel
    
    fileprivate func SignOutButton() -> Button<Text> {
            Button(action: {
                vm.signOut()
            }) {
                Text("Sign Out")
            }
        }
    
    var body: some View {
        VStack{
            if(vm.isLoggedIn){
                SavedView()
                SignOutButton()
            }else{
                GoogleSignInView()
            }
        }.navigationTitle("Login")
    }
}
    
    
//    var body: some View {
//
//                //AuthView()
//
//        //SavedView()
//
//        //NavbarView()
//
//        //HomeView()
//
//        GoogleSignInView()
//            .preferredColorScheme(.dark)
//
//    }
//

//#Preview {
//    ContentView()
//}
