//
//  UserDetailView.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 23/08/2022.
//

import SwiftUI

struct UserDetailView: View {
    
    @State var user: LoadedUser
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Name: \(user.wrappedName)")
                        Text("Age: \(user.age)")
                        Text("Company: \(user.wrappedCompany)")
                    }
                    Spacer()
                }
                CustomDivider()
                
                Text("About Me")
                    .bold()
                    .padding(.bottom, 5)
                Text(user.wrappedAbout)
                
                CustomDivider()
                
                Text("Friends")
                    .bold()
                ForEach(user.friendsArray, id: \.self) { friend in
                    NavigationLink {
                        FriendsDetailView(friend: friend)
                    } label: {
                        HStack {
                            Image("avatar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(friend.wrappedName)
                                    .foregroundColor(.white)
                            }
                            .frame(height: 50)
                        }
                    }
                }
                Spacer()
            }
                .padding(.horizontal)
        }
        .background(.gray.opacity(0.2))
    }
}

