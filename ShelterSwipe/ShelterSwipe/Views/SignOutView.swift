//
//  SignOutView.swift
//  ShelterSwipe
//
//  Created by Claire Wang on 12/1/23.
//

import SwiftUI

struct SignOutView: View {
    
    @EnvironmentObject var vm: UserAuthModel
    
    fileprivate func SignOutButton() -> Button<Text> {
        Button(action: {
            vm.signOut()
        }) {
            Text("Sign Out")
        }
    }
    
    fileprivate func ProfilePic() -> some View {
        AsyncImage(url: URL(string: vm.profilePicUrl))
            .frame(width: 100, height: 100)
    }
    
    fileprivate func UserInfo() -> Text {
        return Text(vm.givenName)
    }
    
    var body: some View {
        signoutview
    }
    
    private var signoutview: some View {
        NavigationView {
            
            VStack{
                Text(vm.givenName)
                    .foregroundColor(Color.purple3)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                AsyncImage(url: URL(string: vm.profilePicUrl))
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                Button(action: {
                    vm.signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.purple1)
                        .clipShape(Capsule())
                }
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color.purple2.ignoresSafeArea()
            }
            .navigationTitle(Text("SignOut"))
            
            
        }
    }
}
    


